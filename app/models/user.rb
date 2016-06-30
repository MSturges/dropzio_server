class User < ActiveRecord::Base
  has_secure_password
  validates :userName, uniqueness: true
end
