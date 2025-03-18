class CreateCommunityItems < ActiveRecord::Migration[7.1]
  def change
    create_table :community_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
