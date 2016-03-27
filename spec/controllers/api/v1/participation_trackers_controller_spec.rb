require 'spec_helper'

describe Api::V1::ParticipationTrackersController do
	describe "GET #show" do
    	before(:each) do 
      		@participation_tracker = FactoryGirl.create :participation_tracker
      		get :show, id: @participation_tracker.id
    	end

    	it "returns the information about a pt on a hash" do
      		pt_response = json_response
      		expect(pt_response[:user_id]).to eql @participation_tracker.user_id
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

  	describe ".find by goal" do
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

    	context "goal1" do
      		it "returns the correct goal" do
        		expect(@pt1.goal.title).to eq "Saving Animals"
      		end

      		it "can get the other associated pts" do
        		expect(@pt4.goal.participation_trackers).to match_array([@pt4, @pt5, @pt6])
      		end
    	end
  	end

  	describe "POST #create" do
    	context "when is successfully created" do
      		before(:each) do
            goal_user = FactoryGirl.create :user
            api_authorization_header goal_user.auth_token 

        		goal = FactoryGirl.create :goal, user: goal_user

            participation_user = FactoryGirl.create :user
            api_authorization_header participation_user.auth_token 

        		@pt1_attributes = { goal_id: goal.id, user_id: participation_user.id }

        		post :create, { participation_tracker: @pt1_attributes}
      		end

      		it "renders the json representation for the goal record just created" do
        		expect(json_response[:user_id]).to eql @pt1_attributes[:user_id]
      		end

      		it { should respond_with 201 }
    	end
  	end

  	describe "GET #index" do
    	context "when is not receiving any ids parameter" do
      		before(:each) do
            4.times { FactoryGirl.create :participation_tracker } 
            get :index
      		end

      		it "returns 4 records from the database" do
        		response = json_response
        		expect(response[:participation_trackers]).to have(4).items
      		end

      		it { should respond_with 200 }
    	end

    	context "when goal_ids parameter is sent" do
      		before(:each) do
        		user = FactoryGirl.create :user
            goal = FactoryGirl.create :goal, user: user

            participation_user = FactoryGirl.create :user

            4.times { FactoryGirl.create :participation_tracker, goal: goal, user_id: participation_user.id }

            get :index, goal_ids: goal.id
      		end

          it "returns 4 records matching goal_id" do
              expect(json_response[:participation_trackers]).to have(4).items
            end
    	end

      context "when user_id parameter is sent" do
        before(:each) do
            user = FactoryGirl.create :user
            goal = FactoryGirl.create :goal, user: user
            goal2 = FactoryGirl.create :goal, user: user

            participation_user = FactoryGirl.create :user

            2.times { FactoryGirl.create :participation_tracker, goal: goal, user_id: participation_user.id }
            2.times { FactoryGirl.create :participation_tracker, goal: goal2, user_id: participation_user.id }
            get :index, user_ids: participation_user.id

            it "returns 4 records matching user_id" do
              expect(json_response[:participation_trackers]).to have(4).items
            end
          end
      end
    end

  	describe "DELETE #destroy" do
    	before(:each) do
      		@user = FactoryGirl.create :user
      		@goal = FactoryGirl.create :goal, user: @user
          @participation_tracker = FactoryGirl.create :participation_tracker, goal: @goal, user_id: @user.id

      		api_authorization_header @user.auth_token 
      		delete :destroy, { user_id: @user.id, id: @participation_tracker.id }
    	end

    	it { should respond_with 204 }
  	end
end
