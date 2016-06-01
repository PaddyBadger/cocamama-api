class ParticipationTracker < ActiveRecord::Base
	require 'active_support'

	after_save :create_steps

	validates :goal_id, :user_id, presence: true

	belongs_to :user
	has_many :steps, dependent: :destroy

	def create_steps
		goal = tracker_goal
		binding.pry
		(goal.start_at.to_date..goal.end_at.to_date).map.each do |day|
			user.steps.build(day: day, participation_tracker_id: self.id, completed: false).save
		end
	end

	def tracker_goal
		Goal.find_by_id(goal_id)
	end
end
