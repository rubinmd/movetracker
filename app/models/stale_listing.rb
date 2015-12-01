class StaleListing < ActiveRecord::Base
  belongs_to :move
  belongs_to :contact
end
