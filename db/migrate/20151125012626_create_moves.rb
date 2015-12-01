class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :user_id
      t.text :notes
      t.boolean :updated_phone
      t.boolean :updated_email
      t.boolean :updated_address
      t.string :name

      t.timestamps

    end
  end
end
