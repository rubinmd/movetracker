class FixStaleMoveChange < ActiveRecord::Migration
  def change
  remove_column :stale_listings, :move_id
  add_column :stale_listings, :change_id, :string
  end
end
