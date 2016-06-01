class Api::V1::GoalsController < ApplicationController
	before_action :authenticate_with_token!, only: [:create, :update, :destroy]
	respond_to :json

	def show
    	respond_with Goal.find(params[:id])
  	end

  	def index
    	goals = params[:goal_ids].present? ? Goal.find(params[:goal_ids]) : Goal.all
    	respond_with goals
  	end

	def create
		goal = current_user.goals.build(goal_params)
		if goal.save
			render json: goal, status: 201
		else
			render json: { errors: goal.errors }, status: 422
		end
	end

	def update
	    goal = current_user.goals.find(params[:id])
	    if goal.update(goal_params)
	      	render json: goal, status: 200, location: [:api, goal]
	    else
	      	render json: { errors: goal.errors }, status: 422
	    end
  	end

  	def destroy
    	goal = current_user.goals.find(params[:id])
    	goal.destroy
    	head 204
  	end

	private

	def goal_params
		params.require(:goal).permit(:category, :title, :description, :icon, :frequency, :count, :start_at, :end_at, challengers_attributes: [:email, :name])
	end
end
