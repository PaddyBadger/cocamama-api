class Goal < ActiveRecord::Base
	belongs_to :user
	after_save :create_participation_trackers

	validates :title, presence: true
  validates :description, presence: true

	has_many :participation_trackers, dependent: :destroy
	has_many :challengers, dependent: :destroy

	accepts_nested_attributes_for :challengers

	enum type: [:race, :total, :distance, :time]
  enum frequency:  [:daily, :weekly, :fortnightly, :monthly, :quarterly, :six_monthly, :yearly]
  enum category: [:body, :money, :people, :mind]

  scope :filter_by_title, -> (keyword) { where("lower(title) LIKE ?", "%#{keyword.downcase}%" ) }

	def create_participation_trackers 
    user.participation_trackers.build(goal_id: self.id).save
	end
end
