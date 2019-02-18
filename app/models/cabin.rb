class Cabin < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :city
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :picture, presence: true
  validates :daily_rate, presence: true
  validates :capacity, presence: true
end
