require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'

SimpleCov.start 'rails' do
  add_filter "/test/"
  add_filter "/app/controllers/step_definitions/"
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
