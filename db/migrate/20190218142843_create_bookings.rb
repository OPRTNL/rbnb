class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :review
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :cabin, foreign_key: true
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
