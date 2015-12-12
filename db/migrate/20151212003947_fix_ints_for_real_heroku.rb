class FixIntsForRealHeroku < ActiveRecord::Migration
  def change
    remove_column :moves, :user_id, :string
    add_column :moves, :user_id, :integer
    remove_column :stale_listings, :contact_id, :string
    add_column :stale_listings, :contact_id, :integer
    remove_column :stale_listings, :move_id, :string
    add_column :stale_listings, :move_id, :integer
  end
end
