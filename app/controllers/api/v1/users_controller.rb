class Api::V1::UsersController < ApplicationController
	respond_to :json
  	before_action :authenticate_with_token!, only: [:update, :destroy, :show]


	def show
		@user = User.find(params[:id]) 
		render 'show', formats: [:json], handlers: [:jbuilder], status: 200
	end

	def create
		user = User.new(user_params) 
		if user.save
			render json: user, status: 201
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def update
		user = current_user

		if user.update(user_params)
			render json: user, status: 200
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def destroy
		current_user.destroy
		head 204
	end

	private

	def user_params
		params.permit(:email, :password, :password_confirmation, :name) 
	end
end
