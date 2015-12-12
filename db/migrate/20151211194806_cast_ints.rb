class CastInts < ActiveRecord::Migration
  def change
    remove_column :contacts, :user_id, :string
    add_column :contacts, :user_id, :integer
  end
end
