class UserCommunity < ApplicationRecord
  belongs_to :user
  belongs_to :community
  enum :role, [:admin, :member]
end
