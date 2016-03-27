class Api::V1::ParticipationTrackersController < ApplicationController
	before_action :authenticate_with_token!, only: [:create, :destroy]
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
		params.require(:participation_tracker).permit(:goal_id, :user_id)
	end
end
