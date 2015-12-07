class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :user_id
      t.string :contact_id
      t.text :content

      t.timestamps null: false
    end
  end
end
