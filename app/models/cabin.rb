class Cabin < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :picture, presence: true
  validates :daily_rate, presence: true
  # validates :capacity, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_name_description_and_localisation,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def rating
  ratings = []
  bookings.each do |booking|
    ratings << booking.rating if booking.rating.nil? != true
  end
  sum_rating = ratings.sum.fdiv(ratings.length)

  sum_rating.nan? ? "New" : sum_rating
  end

  # def all_booked_nights
  #   # bookings = self.bookings
  #   self.bookings.pluck(:check_in, :check_out).map { |b| (b[0]..b[1]).to_a }.flatten.uniq.sort
  # end
end
