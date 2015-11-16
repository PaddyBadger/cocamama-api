class Api::V1::ChallengesController < ApplicationController
	before_action :authenticate_with_token!, only: [:create, :update, :destroy]
	respond_to :json

	def show
    	respond_with Challenge.find(params[:id])
  	end

  	def index
    	challenges = params[:challenge_ids].present? ? Challenge.find(params[:challenge_ids]) : Challenge.all
    	respond_with challenges
  	end

	def create
		challenge = current_user.challenges.build(challenge_params)
		if challenge.save
			render json: challenge, status: 201, location: [:api, challenge]
		else
			render json: { errors: challenge.errors }, status: 422
		end
	end

	def update
	    challenge = current_user.challenges.find(params[:id])
	    if challenge.update(challenge_params)
	      	render json: challenge, status: 200, location: [:api, challenge]
	    else
	      	render json: { errors: challenge.errors }, status: 422
	    end
  	end

  	def destroy
    	challenge = current_user.challenges.find(params[:id])
    	challenge.destroy
    	head 204
  	end

	private

	def challenge_params
		params.require(:challenge).permit(:step_id)
	end
end
