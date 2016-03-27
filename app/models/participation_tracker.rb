class ParticipationTracker < ActiveRecord::Base
	before_save :create_steps

	validates :goal_id, :user_id, presence: true

	belongs_to :goal
	has_many :steps, dependent: :destroy

	def create_steps
		
	end
end
