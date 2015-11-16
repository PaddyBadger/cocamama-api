class ParticipationTracker < ActiveRecord::Base
	validates :challenge_id, presence: true

	belongs_to :challenge
	has_many :tracks, dependent: :destroy
end
