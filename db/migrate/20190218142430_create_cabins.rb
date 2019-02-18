class CreateCabins < ActiveRecord::Migration[5.2]
  def change
    create_table :cabins do |t|
      t.string :name
      t.string :description
      t.integer :rating
      t.integer :daily_rate
      t.integer :max_people
      t.string :picture
      t.boolean :kitchen
      t.boolean :lake
      t.boolean :hot_water
      t.boolean :wifi
      t.boolean :available
      t.string :address
      t.boolean :beach
      t.boolean :mountain
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
