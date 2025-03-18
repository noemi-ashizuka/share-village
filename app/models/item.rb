#   t.string "name"
#   t.text "description"
#   t.integer "price"
#   t.string "category"
#   t.bigint "user_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false

class Item < ApplicationRecord
  belongs_to :user
  has_many :community_items
  has_many :communities, through: :community_items
end
