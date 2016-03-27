# Use this module to configure the sabisu available options

SabisuRails.setup do |config|

  # Base uri for posting the 
  config.base_api_uri = 'api.cocamamaapi.dev'
  config.api_headers = { "Accept" => "api/v1" }

  # Resources on the api
  config.resources = [:users, :goals, :goal_templates, :participation_trackers, :steps, :icons]
  config.default_resource = 'users'

end
