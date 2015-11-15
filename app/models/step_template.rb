class StepTemplate < ActiveRecord::Base
	validates :title, :category, :description, presence: true
end
