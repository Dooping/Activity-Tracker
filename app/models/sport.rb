class Sport < ActiveRecord::Base
	has_many :activities
	has_many :team
end
