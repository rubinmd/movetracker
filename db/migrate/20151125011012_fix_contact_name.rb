class FixContactName < ActiveRecord::Migration
  def change
    remove_column :contacts, :business_name
    add_column :contacts, :name, :string
  end
end
