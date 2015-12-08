class Step < ActiveRecord::Base
	validates :participation_tracker_id, presence: true

	belongs_to :participation_tracker
end
