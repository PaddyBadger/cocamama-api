require 'spec_helper'

RSpec.describe Api::V1::GoalTemplatesController do
	describe "GET #index" do
		before(:each) do
			4.times { FactoryGirl.create :goal_template }
			get :index
		end

		it "returns 4 goal_templates" do
			goal_templates_response = json_response[:goal_templates]
			binding.pry
			expect(goal_templates_response).to have(4).items
		end

		it { should respond_with 200 }
	end

	describe "GET #show" do
		before(:each) do
			@goal_template = FactoryGirl.create :goal_template
			get :show, id: @goal_template.id
		end

		it "returns the user goal_template matching the id" do
			goal_template_response = json_response[:goal_template]
			expect(goal_template_response[:id]).to eql @goal_template.id
		end

		it { should respond_with 200 }
	end
end
