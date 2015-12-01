class Contact < ActiveRecord::Base
  has_many :moves, :through => :stale_listings , :source => :moves
  belongs_to :user
  has_many :stale_listings , :class_name => "StaleListing", :foreign_key => "contact_id", dependent: :destroy, foreign_key: :contact_id
  validates :name, :presence=>true

  validate :move_type

  private

    def move_type
      if [has_phone, has_address, has_email].compact.include?(true) == false
        errors.add(:base, "Please select at least one type of contact information")
      end
    end
end
