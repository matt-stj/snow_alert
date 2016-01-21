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
  DatabaseCleaner.strategy = :transaction

  def setup
    DatabaseCleaner.start
    stub_omniauth
  end

  def teardown
    DatabaseCleaner.clean
    reset_session!
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({"provider"=>"facebook",
      "uid"=>"12345",
      "info"=>{"name"=>"Matt Test", "image"=>"http://graph.facebook.com/12345/picture"},
      "credentials"=>
      {"token"=>
        "test_token",
        "expires_at"=>1457915664,
        "expires"=>true},
        "extra"=>{"raw_info"=>{"name"=>"Matt Test", "id"=>"12345"}}})
  end


end
