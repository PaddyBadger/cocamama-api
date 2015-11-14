ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
abort("The Rails environment is running in production mode!") if Rails.env.production?

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

    # config.expect_with :rspec do |expectations|
    #     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    # end

    # config.mock_with :rspec do |mocks|
    #     mocks.verify_partial_doubles = true
    # end

    config.include Request::JsonHelpers, :type => :controller
    config.include Request::HeadersHelpers, :type => :controller
    config.include Devise::TestHelpers, :type => :controller
    config.include(Shoulda::Matchers::ActiveModel, type: :model)
    config.include(Shoulda::Matchers::ActiveRecord, type: :model)

    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_spec_type_from_file_location!
    config.before(:each, type: :controller) do
        include_default_accept_headers
    end
end

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
    end
end
