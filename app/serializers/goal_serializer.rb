class GoalSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :category, :frequency, :count, :published

	has_many :participation_trackers
	belongs_to :user
end
