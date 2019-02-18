class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.boolean :owner
      t.string :email
      t.string :description
      t.string :profile_pic

      t.timestamps
    end
  end
end
