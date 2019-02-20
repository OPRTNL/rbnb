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
  bookings.each do |booking|
    ratings << booking.rating
  end
  p ratings.sum.fdiv(ratings.length)
  return ratings.sum.fdiv(ratings.length)
  end

  def all_booked_nights
    # bookings = self.bookings
    self.bookings.pluck(:check_in, :check_out).map { |b| (b[0]..b[1]).to_a }.flatten.uniq.sort
  end
end
