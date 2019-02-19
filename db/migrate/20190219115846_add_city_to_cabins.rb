class AddCityToCabins < ActiveRecord::Migration[5.2]
  def change
    add_column :cabins, :city, :string
  end
end
