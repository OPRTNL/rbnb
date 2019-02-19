class Cabin < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :picture, presence: true
  validates :daily_rate, presence: true
  validates :capacity, presence: true

  def rating
    ratings = []
    @cabin.bookings do |booking|
      ratings << booking.rating
    end
    return ratings.sum.fdiv(ratings.length)
  end
end
