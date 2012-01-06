class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.point :latlon, :geographic => true

      t.timestamps
    end
  end
end
