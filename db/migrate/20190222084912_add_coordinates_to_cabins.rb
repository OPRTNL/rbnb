class AddCoordinatesToCabins < ActiveRecord::Migration[5.2]
  def change
    add_column :cabins, :latitude, :float
    add_column :cabins, :longitude, :float
  end
end
