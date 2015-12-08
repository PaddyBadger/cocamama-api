class ParticipationTrackersSerializer < ActiveModel::Serializer
  attributes :id, :user

  belongs_to :goal
  has_many :steps
end
