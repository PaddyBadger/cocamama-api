require 'spec_helper'

RSpec.describe Api::V1::GoalsController do

  	describe "GET #show" do
    	before(:each) do 
      		@goal = FactoryGirl.create :goal
      		get :show, id: @goal.id
    	end

    	it "returns the information about a goal on a hash" do
      		goal_response = json_response
      		expect(goal_response[:title]).to eql @goal.title
    	end

    	it { should respond_with 200 }
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

  	describe ".filter_by_title" do
	    before(:each) do
	      @goal1 = FactoryGirl.create :goal, title: "Saving Animals"
	      @goal2 = FactoryGirl.create :goal, title: "Gym Visits"
	      @goal3 = FactoryGirl.create :goal, title: "No Alcohol"
	      @goal4 = FactoryGirl.create :goal, title: "Saving money"
	    end

    	context "when a 'Saving' title pattern is sent" do
      		it "returns the 2 goals matching" do
        		expect(Goal.filter_by_title("Saving")).to have(2).items
      		end

      		it "returns the goals matching" do
        		expect(Goal.filter_by_title("Saving").sort).to match_array([@goal1, @goal4])
      		end
    	end
  	end

  	describe "POST #create" do
    	context "when is successfully created" do
      		before(:each) do
        		user = FactoryGirl.create :user
        		@goal_attributes = FactoryGirl.attributes_for :goal
        		api_authorization_header user.auth_token 
        		post :create, { user_id: user.id, goal: @goal_attributes }
      		end

      		it "renders the json representation for the goal record just created" do
        		goal_response = json_response[:goal]
        		expect(goal_response[:title]).to eql @goal_attributes[:title]
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