require 'spec_helper'
require 'api/api_helper'
require 'fakeweb'
require 'timecop'

describe 'Tasks API' do

  before :each do
    FactoryGirl.create :integration
    FactoryGirl.create :project
    FactoryGirl.create :task
    Project.last.integrations << Integration.last
  end

  # GET /tasks/:id
  it 'should return a single task' do
    api_get "tasks/#{Task.last.id}", {token: Integration.last.user.api_key.token}
    response.status.should == 200

    project = JSON.parse(response.body)
    project['id'].should == Task.last.id
    project['project_id'].should == Task.last.project_id
    project['source_name'].should == Task.last.source_name
    project['source_identifier'].should == Task.last.source_identifier
    project['current_state'].should == Task.last.current_state
    project['story_type'].should == Task.last.story_type
    project['current_task'].should == Task.last.current_task
    project['name'].should == Task.last.name
  end
end
