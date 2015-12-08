class GoalTemplate < ActiveRecord::Base
	validates :title, :category, :description, presence: true
end
