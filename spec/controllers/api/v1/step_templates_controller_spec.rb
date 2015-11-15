require 'spec_helper'

RSpec.describe Api::V1::StepTemplatesController do
	describe "GET #index" do
		before(:each) do
			4.times { FactoryGirl.create :step_template }
			get :index
		end

		it "returns 4 step_templates" do
			step_templates_response = json_response[:step_templates]
			expect(step_templates_response).to have(4).items
		end

		it { should respond_with 200 }
	end

	describe "GET #show" do
		before(:each) do
			@step_template = FactoryGirl.create :step_template
			get :show, id: @step_template.id
		end

		it "returns the user step_template matching the id" do
			step_template_response = json_response[:step_template]
			expect(step_template_response[:id]).to eql @step_template.id
		end

		it { should respond_with 200 }
	end
end
