class User < ActiveRecord::Base
  has_secure_password
  
  has_many :lynks
  has_many :deals
end
