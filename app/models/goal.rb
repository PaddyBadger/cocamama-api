class Goal < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true
  	validates :description, presence: true
	has_many :participation_trackers, dependent: :destroy

	enum type: [:race, :total, :distance, :time]
  	enum frequency:  [:daily, :weekly, :monthly]
  	enum category: [:body, :money, :people, :mind]

  	scope :filter_by_title, -> (keyword) { where("lower(title) LIKE ?", "%#{keyword.downcase}%" ) }
end
