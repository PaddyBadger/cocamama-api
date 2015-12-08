class Api::V1::GoalTemplatesController < ApplicationController
  	respond_to :json

  	def index
    	respond_with GoalTemplate.all
  	end

  	def show
  		respond_with GoalTemplate.find(params[:id])
	end
end
