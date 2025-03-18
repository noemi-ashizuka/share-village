class Community < ApplicationRecord
  has_many :community_items
  has_many :items, thorugh: :community_items
  has_many :user_communities
  has_many :users, through: :user_communities
  validates :name, presence: true
end
