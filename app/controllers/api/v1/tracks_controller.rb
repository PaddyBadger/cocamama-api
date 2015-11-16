class Api::V1::TracksController < ApplicationController
	before_action :authenticate_with_token!, only: [:create, :update, :destroy]
	respond_to :json

	def show
    	respond_with Track.find(params[:id])
  	end

  	def index
    	tracks = params[:track_ids].present? ? Track.find(params[:track_ids]) : Track.all
    	respond_with tracks
  	end

	def create
		track = current_user.tracks.build(track_params)
		if track.save
			render json: track, status: 201, location: [:api, track]
		else
			render json: { errors: track.errors }, status: 422
		end
	end

	def update
	    track = current_user.tracks.find(params[:id])
	    if track.update(track_params)
	      	render json: track, status: 200, location: [:api, track]
	    else
	      	render json: { errors: track.errors }, status: 422
	    end
  	end

  	def destroy
    	track = current_user.tracks.find(params[:id])
    	track.destroy
    	head 204
  	end

	private

	def track_params
		params.require(:track).permit(:participation_tracker_id, :completed)
	end
end
