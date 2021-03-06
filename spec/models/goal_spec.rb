require 'spec_helper'

RSpec.describe Goal do
  let(:goal) { FactoryGirl.build :goal }
  subject { goal }

  it { should belong_to :user }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should have_many(:participation_trackers) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :user_id }
end
