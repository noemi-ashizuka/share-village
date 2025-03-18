class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.references :invited_by, foreign_key: { to_table: :users }
      t.references :community, null: false, foreign_key: true
      t.integer :status
      t.string :token

      t.timestamps
    end
  end
end
