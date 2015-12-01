class CreateStaleListings < ActiveRecord::Migration
  def change
    create_table :stale_listings do |t|
      t.boolean :out_of_date_address
      t.boolean :out_of_date_email
      t.boolean :out_of_date_phone
      t.string :move_id
      t.string :contact_id

      t.timestamps

    end
  end
end
