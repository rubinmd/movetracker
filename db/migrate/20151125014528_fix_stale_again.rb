class FixStaleAgain < ActiveRecord::Migration
  def change
    remove_column :stale_listings, :change_id
    add_column :stale_listings, :move_id, :string
  end
end
