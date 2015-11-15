require 'spec_helper'

RSpec.describe StepTemplate do
  let(:step_template) { FactoryGirl.build :step_template }

  subject { step_template }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:category) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :category }
end
