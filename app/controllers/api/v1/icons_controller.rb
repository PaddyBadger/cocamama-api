class Api::V1::IconsController < ApplicationController
  	respond_to :json

  	def index
    	@icons = Icon.all
    	render json: @icons.to_json
  	end
end