class Community < ApplicationRecord
  has_many :community_items
  has_many :items, through: :community_items
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities
  validates :name, presence: true
end
