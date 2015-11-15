class Step < ActiveRecord::Base
	validates :title, :user_id, presence: true
  	validates :description, :user_id, presence: true
  	belongs_to :user

  	enum frequency:  [:daily, :weekly, :monthly]
  	enum category: [:health, :finances, :relationships, :career, :personal_wellbeing, :adventure]

  	scope :filter_by_title, -> (keyword) { where("lower(title) LIKE ?", "%#{keyword.downcase}%" ) }
end
