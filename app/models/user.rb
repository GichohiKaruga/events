class User < ActiveRecord::Base
  has_secure_password
  has_many :userevents
  has_many :events, through: :userevents
end
