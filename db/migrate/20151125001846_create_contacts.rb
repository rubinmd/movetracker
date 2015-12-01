class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :user_id
      t.text :notes
      t.boolean :has_phone
      t.boolean :has_email
      t.boolean :has_address
      t.string :business_name

      t.timestamps

    end
  end
end
