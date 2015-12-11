class RestOfFks < ActiveRecord::Migration
  def change
    change_column :contacts, :user_id, :integer
  end
end
