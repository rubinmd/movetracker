class Change < ActiveRecord::Base
  has_many :stale_listings , :class_name => "StaleListing", :foreign_key => "change_id"
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
  has_many :contacts, :through => :stale_listings
end
