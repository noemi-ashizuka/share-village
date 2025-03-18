class CommunityItem < ApplicationRecord
  belongs_to :item
  belongs_to :community

  validates :name, presence: true
end
