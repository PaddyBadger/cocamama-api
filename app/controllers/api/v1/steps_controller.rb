class Api::V1::StepsController < ApplicationController
	before_action :authenticate_with_token!, only: [:create]
	respond_to :json

	def show
    	respond_with Step.find(params[:id])
  	end

  	def index
    	steps = params[:step_ids].present? ? Step.find(params[:step_ids]) : Step.all
    	respond_with steps
  	end

	def create
		step = current_user.steps.build(step_params)
		if step.save
			render json: step, status: 201, location: [:api, step]
		else
			render json: { errors: step.errors }, status: 422
		end
	end

	def update
	    step = current_user.steps.find(params[:id])
	    if step.update(step_params)
	      	render json: step, status: 200, location: [:api, step]
	    else
	      	render json: { errors: step.errors }, status: 422
	    end
  	end

  	def destroy
    	step = current_user.steps.find(params[:id])
    	step.destroy
    	head 204
  	end

	private

	def step_params
		params.require(:step).permit(:title, :description, :published)
	end
end
