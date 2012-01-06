class CreateLocations < ActiveRecord::Migration
  def change
    ActiveRecord::Base.establish_connection(::SpacialdbConnectionConfig) if Rails.env == "production"

    create_table :locations do |t|
      t.string :name
      t.point :latlon, :geographic => true

      t.timestamps
    end
  end
end
