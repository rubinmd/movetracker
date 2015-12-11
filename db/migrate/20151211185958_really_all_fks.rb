class ReallyAllFks < ActiveRecord::Migration
  def change
    change_column :moves, :user_id, :integer
    change_column :notes, :user_id, :integer
    change_column :notes, :contact_id, :integer
    change_column :stale_listings, :move_id, :integer
    change_column :stale_listings, :contact_id, :integer
  end
end
