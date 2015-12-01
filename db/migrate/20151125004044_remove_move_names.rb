class RemoveMoveNames < ActiveRecord::Migration
  def change
    remove_column :changes, :move_phone
    remove_column :changes, :move_address
    remove_column :changes, :move_email
    remove_column :changes, :move_name
    add_column :changes, :name, :string
    add_column :changes, :new_email, :boolean
    add_column :changes, :new_phone, :boolean
    add_column :changes, :new_address, :boolean
  end
end
