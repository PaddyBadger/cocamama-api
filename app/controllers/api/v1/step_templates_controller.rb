class Api::V1::StepTemplatesController < ApplicationController
  	respond_to :json

  	def index
    	respond_with StepTemplate.all
  	end

  	def show
  		respond_with StepTemplate.find(params[:id])
	end
end
