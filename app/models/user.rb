class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_cabins, class_name: "Cabin"
  has_many :bookings, dependent: :destroy
  # has_many :booked_cabins, through: :bookings, source: :cabin



  # has_many :tables

  #   => Table            => class_name
  #   => user_id          => foreign_key
end
