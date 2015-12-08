class Goal < ActiveRecord::Base
	validates :title, :user_id, presence: true
  	validates :description, presence: true
  	belongs_to :user
	has_many :participation_trackers, dependent: :destroy

  	enum frequency:  [:daily, :weekly, :monthly]
  	enum category: [:health, :finances, :relationships, :career, :personal_wellbeing, :adventure]

  	scope :filter_by_title, -> (keyword) { where("lower(title) LIKE ?", "%#{keyword.downcase}%" ) }
end
