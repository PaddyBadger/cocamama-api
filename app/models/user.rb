class User < ActiveRecord::Base

	has_one :api_key, dependent: :destroy
	has_one :name, :email, :password
	has_many :steps, :associated_users, :invited_users
	after_create :create_api_key

	private 

	def created_at
		created_at.in_time_zone.local if created_at
	end

	def updated_at
		updated_at.in_time_zone.local if updated_at
	end

	def create_api_key
		ApiKey.create :user => self
	end
end