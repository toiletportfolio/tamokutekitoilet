class AddLatitudeToAreas < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :latitude, :float
    add_column :areas, :longitude, :float
  end
end
