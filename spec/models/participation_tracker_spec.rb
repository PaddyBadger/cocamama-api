require 'spec_helper'

describe ParticipationTracker do
  let(:participation_tracker) { FactoryGirl.build :participation_tracker }
  subject { goal }

  it { should belong_to :goal }
  it { should have_many(:steps) }
  it { should respond_to(:user_id) }
  it { should validate_presence_of :user_id }
end
