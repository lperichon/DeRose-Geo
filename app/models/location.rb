class Location < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlon, RGeo::Geographic.spherical_factory(:srid => 4326))

  attr_accessor :latitude, :longitude

  before_save :set_latlon

  validate :latitude, :longitude, :presence => true, :numericality => true
  validate :name, :presence => true

  scope :nearby_to,
    lambda { |location, max_distance|
      where("ST_DWithin(latlon, ?, ?) AND id != ?", location.latlon, max_distance, location.id)
    }

  def latitude
    self.latlon.latitude if self.latlon.present?
  end

  def longitude
    self.latlon.longitude if self.latlon.present?
  end

  private

  def set_latlon
    self.latlon = "POINT(#{@longitude} #{@latitude})" if @latitude.present? && @longitude.present?
  end

end
