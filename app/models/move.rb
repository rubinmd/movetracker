class Move < ActiveRecord::Base
  has_many :stale_listings ,dependent: :destroy, :class_name => "StaleListing", :foreign_key => "move_id"
  belongs_to :user
  has_many :contacts, :through => :stale_listings, foreign_key: :move_id
  validates :name, :presence=>true
  validate :move_type

  private

    def move_type
      if [updated_phone, updated_address, updated_email].compact.include?(true)==false
        errors.add(:base, "Please select at least one type of change")
      end
    end
end
