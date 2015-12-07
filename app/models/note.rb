class Note < ActiveRecord::Base
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
  belongs_to :contacts, :class_name => "Contact", :foreign_key => "contact_id"
  #validates :user_id, presence=>true
  #validates :contact_id, presence=>true
end
