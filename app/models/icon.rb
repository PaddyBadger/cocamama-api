class Icon < ActiveRecord::Base
	serialize :keywords
	validates :name, :keywords, presence: true
end
