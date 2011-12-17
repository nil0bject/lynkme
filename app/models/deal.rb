class Deal < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  
  has_many :lynks
end
