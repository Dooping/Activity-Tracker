class Activity < ActiveRecord::Base
  belongs_to :user
  has_one :sport
end
