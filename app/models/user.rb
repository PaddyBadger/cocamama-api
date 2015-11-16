class User < ActiveRecord::Base
	validates :auth_token, uniqueness: true

	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	before_create :generate_authentication_token!
	has_many :steps
	has_many :challenges, through: :steps
	has_many :participation_trackers, through: :challenges
	has_many :tracks, through: :participation_trackers

	def generate_authentication_token!	
		begin
		  self.auth_token = Devise.friendly_token
		end while self.class.exists?(auth_token: auth_token)
	end
end
