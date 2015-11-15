class Step < ActiveRecord::Base
	validates :title, :user_id, presence: true
  	validates :description, :user_id, presence: true
  	belongs_to :user
end
