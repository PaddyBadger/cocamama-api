require 'spec_helper'

RSpec.describe Api::V1::StepsController do
	describe "GET #show" do
		before(:each) do
			@step = FactoryGirl.create :step
			get :show, id: @step.id
		end

		it "returns the information about a reporter on a hash" do
			step_response = json_response
			expect(step_response[:title]).to eql @step.title
		end

		it { should respond_with 200 }
	end

	describe "GET #index" do
	    before(:each) do
	      	4.times { FactoryGirl.create :step }
	      	get :index
	    end

	    it "returns 4 records from the database" do
	      	steps_response = json_response
	      	expect(steps_response[:steps]).to have(4).items
	    end

	    it { should respond_with 200 }
	end

	describe "POST #create" do
		context "when is successfully created" do
			before(:each) do
				user = FactoryGirl.create :user
				@step_attributes = FactoryGirl.attributes_for :step
				api_authorization_header user.auth_token
				post :create, { user_id: user.id, step: @step_attributes }
			end

			it "renders the json representation for the step record just created" do
				step_response = json_response
				expect(step_response[:title]).to eql @step_attributes[:title]
			end

			it { should respond_with 201 }
		end
	end

	describe "PUT/PATCH #update" do
		before(:each) do
			@user = FactoryGirl.create :user
			@step = FactoryGirl.create :step, user: @user
			api_authorization_header @user.auth_token
		end

		context "when is successfully updated" do
			before(:each) do
				patch :update, { user_id: @user.id, id: @step.id,
			      	step: { title: "Vegitarianism" } }
			end

			it "renders the json representation for the updated user" do
				step_response = json_response
				expect(step_response[:title]).to eql "Vegitarianism"
			end

			it { should respond_with 200 }
		end
	end

	describe "DELETE #destroy" do
		before(:each) do
			@user = FactoryGirl.create :user
			@step = FactoryGirl.create :step, user: @user
			api_authorization_header @user.auth_token
			delete :destroy, { user_id: @user.id, id: @step.id }
		end

		it { should respond_with 204 }
  	end
end
