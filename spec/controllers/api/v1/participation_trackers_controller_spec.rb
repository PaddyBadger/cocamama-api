require 'spec_helper'

describe Api::V1::ParticipationTrackersController do
	describe "GET #show" do
    	before(:each) do 
      		@participation_tracker = FactoryGirl.create :participation_tracker
      		get :show, id: @participation_tracker.id
    	end

    	it "returns the information about a pt on a hash" do
      		pt_response = json_response
      		expect(pt_response[:user]).to eql @participation_tracker.user
    	end

    	it { should respond_with 200 }
  	end

  	describe "GET #index" do
    	before(:each) do
      		4.times { FactoryGirl.create :participation_tracker } 
    	end

    	context "when is not receiving any pt_ids parameter" do
      		before(:each) do
        		get :index
      		end

      		it "returns 4 records from the database" do
        		pts_response = json_response
        		expect(pts_response[:participation_trackers]).to have(4).items
      		end

      		it { should respond_with 200 }
    	end

    	context "when pt_ids parameter is sent" do
      		before(:each) do
        		@goal = FactoryGirl.create :goal
        		3.times { FactoryGirl.create :participation_tracker, goal: @goal }
        		get :index, participation_tracker_ids: @goal.participation_tracker_ids
      		end
    	end
  	end

  	describe ".filter_by_title" do
	    before(:each) do
	      @goal1 = FactoryGirl.create :goal, title: "Saving Animals"
	      @pt1 = FactoryGirl.create :participation_tracker, goal: @goal1
	      @pt2 = FactoryGirl.create :participation_tracker, goal: @goal1
	      @pt3 = FactoryGirl.create :participation_tracker, goal: @goal1

	      @goal2 = FactoryGirl.create :goal, title: "Gym Visits"
	      @pt4 = FactoryGirl.create :participation_tracker, goal: @goal2
	      @pt5 = FactoryGirl.create :participation_tracker, goal: @goal2
	      @pt6 = FactoryGirl.create :participation_tracker, goal: @goal2
	    end

    	context "when a 'Saving' title pattern is sent" do
      		it "returns the 3 pts for goal matching" do
        		expect(ParticipationTracker.filter_by_goal("Saving")).to have(3).items
      		end

      		it "returns the 3 pts for goal matching" do
        		expect(ParticipationTracker.filter_by_goal("Saving").sort).to match_array([@pt1, @pt2, @pt3])
      		end
    	end
  	end

  	describe "POST #create" do
    	context "when is successfully created" do
      		before(:each) do
        		@goal = FactoryGirl.create :goal, user: user

        		user = FactoryGirl.create :user
        		api_authorization_header user.auth_token 
        		@pt1_attributes = FactoryGirl.attributes_for :participation_tracker

        		post :create, { goal: @goal, user_id: user.id, participation_tracker: @pt1_attributes}
      		end

      		it "renders the json representation for the goal record just created" do
        		goal_response = json_response[:participation_tracker]
        		expect(goal_response[:user_id]).to eql @pt1_attributes[:user_id]
      		end

      		it { should respond_with 201 }
    	end
  	end

  describe "PUT/PATCH #update" do
    	before(:each) do
      		@user = FactoryGirl.create :user
      		@goal = FactoryGirl.create :goal, user: @user
      		api_authorization_header @user.auth_token 
    	end

    	context "when is successfully updated" do
      		before(:each) do
        		patch :update, { user_id: @user.id, id: @goal.id, goal: { title: "Vegitarianism" } }
      		end

      		it "renders the json representation for the updated user" do
        		goal_response = json_response[:goal]
        		expect(goal_response[:title]).to eql "Vegitarianism"
      		end

      		it { should respond_with 200 }
    	end
  	end

  	describe "GET #index" do
    	before(:each) do
      		4.times { FactoryGirl.create :goal } 
    	end

    	context "when is not receiving any goal_ids parameter" do
      		before(:each) do
        		get :index
      		end

      		it "returns 4 records from the database" do
        		goals_response = json_response
        		expect(goals_response[:goals]).to have(4).items
      		end

      		it { should respond_with 200 }
    	end

    	context "when goal_ids parameter is sent" do
      		before(:each) do
        		@user = FactoryGirl.create :user
        		3.times { FactoryGirl.create :goal, user: @user }
        		get :index, goal_ids: @user.goal_ids
      		end
    	end
    end

  	describe "DELETE #destroy" do
    	before(:each) do
      		@user = FactoryGirl.create :user
      		@goal = FactoryGirl.create :goal, user: @user
      		api_authorization_header @user.auth_token 
      		delete :destroy, { user_id: @user.id, id: @goal.id }
    	end

    	it { should respond_with 204 }
  	end
end
