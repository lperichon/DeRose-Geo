class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @nearby_locations = Location.nearby_to(@location, 1000)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])

    if @location.save
      redirect_to @location, :notice => 'Location was successfully created.'
    else
      render :action => "new"
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(params[:location])
      redirect_to @location, :notice => 'Location was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_url
  end
end