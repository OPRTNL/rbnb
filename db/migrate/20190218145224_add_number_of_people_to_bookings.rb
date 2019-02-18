class AddNumberOfPeopleToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :number_of_people, :integer
  end
end
