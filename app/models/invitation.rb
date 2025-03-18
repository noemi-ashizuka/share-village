class Invitation < ApplicationRecord
  belongs_to :invited_by, :class_name => "User"
  belongs_to :community
end
