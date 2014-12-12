class Team < ActiveRecord::Base
	belongs_to :profile
	has_one :sport
end
