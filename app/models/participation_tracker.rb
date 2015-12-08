class ParticipationTracker < ActiveRecord::Base
	validates :goal_id, presence: true

	belongs_to :goal
	has_one :user
	has_many :steps, dependent: :destroy
end
