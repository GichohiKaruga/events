class Event < ActiveRecord::Base
  has_many :userevents
  has_many :users, through: :userevents
end
