class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_cabins, class_name: "Cabin", foreign_key: :cabin_id
  has_many :bookings, dependent: :destroy
  has_many :booked_cabins, through: :bookings, class_name: "Cabin"
end
