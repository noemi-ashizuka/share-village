class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :items, dependent: :destroy
  has_many :bookings_as_owner, through: :items, source: :bookings
  has_many :user_communities, dependent: :destroy
  has_many :communities, through: :user_communities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
