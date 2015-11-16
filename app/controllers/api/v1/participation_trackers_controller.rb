class Api::V1::ParticipationTrackersController < ApplicationController
	before_action :authenticate_with_token!, only: [:create, :update, :destroy]
	respond_to :json

	def show
    	respond_with ParticipationTracker.find(params[:id])
  	end

  	def index
    	participation_trackers = params[:participation_tracker_ids].present? ? ParticipationTracker.find(params[:participation_tracker_ids]) : ParticipationTracker.all
    	respond_with participation_trackers
  	end

	def create
		participation_tracker = current_user.participation_trackers.build(participation_tracker_params)
		if participation_tracker.save
			render json: participation_tracker, status: 201, location: [:api, participation_tracker]
		else
			render json: { errors: step.errors }, status: 422
		end
	end

	def update
	    participation_tracker = current_user.participation_tracker.find(params[:id])
	    if participation_tracker.update(participation_tracker_params)
	      	render json: participation_tracker, status: 200, location: [:api, participation_tracker]
	    else
	      	render json: { errors: participation_tracker.errors }, status: 422
	    end
  	end

  	def destroy
    	participation_tracker = current_user.participation_trackers.find(params[:id])
    	participation_tracker.destroy
    	head 204
  	end

	private

	def participation_tracker_params
		params.require(:participation_tracker).permit(:challenge_id)
	end
end
