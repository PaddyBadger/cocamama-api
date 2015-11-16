class Challenge < ActiveRecord::Base
	validates :step_id, presence: true

	belongs_to :step
	has_many :participation_trackers, dependent: :destroy

	def winner
		# Figure out what winner means here
	end
end
