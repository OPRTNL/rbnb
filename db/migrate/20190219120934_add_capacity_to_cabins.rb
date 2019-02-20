class AddCapacityToCabins < ActiveRecord::Migration[5.2]
  def change
    add_column :cabins, :capacity, :integer
  end
end
