class User < ActiveRecord::Base
	validates :auth_token, uniqueness: true

	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	before_create :generate_authentication_token!
	has_many :goals, dependent: :destroy
	has_many :participation_trackers, through: :goals
	has_many :steps, through: :participation_trackers

	def generate_authentication_token!	
		begin
		  self.auth_token = Devise.friendly_token
		end while self.class.exists?(auth_token: auth_token)
	end
end
