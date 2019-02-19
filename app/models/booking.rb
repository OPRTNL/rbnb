class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cabin
  validates_uniqueness_of :cabin, scope: :user
  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :rating, inclusion
end
