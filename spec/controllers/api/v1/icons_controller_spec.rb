require 'spec_helper'

RSpec.describe Api::V1::IconsController do
	describe "GET #index" do
		before(:each) do
			20.times { FactoryGirl.create :icon }
			get :index
		end

		it "returns 20 icons" do
			icons_response = json_response[:icons]
			expect(icons_response).to have(20).items
		end

		it { should respond_with 200 }
	end
end