require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'minitest/pride'
require 'webmock'
require 'vcr'

class ActiveSupport::TestCase
  VCR.configure do |config|
    config.before_record do |i|
      i.response.body.force_encoding('UTF-8')
    end
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
  end
end
