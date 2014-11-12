class Friendship < ActiveRecord::Base
  has_many :users, through :profile
end
