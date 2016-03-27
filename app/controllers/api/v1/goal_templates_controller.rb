class Api::V1::GoalTemplatesController < ApplicationController
  	respond_to :json

  	def index
  		@goal_templates = GoalTemplate.all
    	render json: @goal_templates.to_json
  	end

  	def show
  		render json: GoalTemplate.find(params[:id])
	end
end
