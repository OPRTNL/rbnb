class User < ApplicationRecord
  has_many :owned_cabins, class_name: "Cabin"
  has_many :bookings, dependent: :destroy
  has_many :booked_cabins, through: :bookings, class_name: "Cabin"
end
