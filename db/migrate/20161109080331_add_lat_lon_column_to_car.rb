class AddLatLonColumnToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :latitude, :float
    add_column :cars, :longitude, :float
  end
end
