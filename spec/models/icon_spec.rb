require 'spec_helper'

 RSpec.describe Icon do
  let(:icon) { FactoryGirl.build :icon }

  subject { icon }

  it { should respond_to(:name) }
  it { should respond_to(:keywords) }
end
