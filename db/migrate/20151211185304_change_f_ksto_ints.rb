class ChangeFKstoInts < ActiveRecord::Migration
  def change
    change_column :changes, :user_id, :int
  end
end
