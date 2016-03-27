require 'spec_helper'

RSpec.describe GoalTemplate do
  let(:goal_template) { FactoryGirl.build :goal_template }

  subject { goal_template }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:category) }
  it { should respond_to(:published) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :category }

  it 'Should not be published' do
  	expect(subject.published).to eq false
  end
end
