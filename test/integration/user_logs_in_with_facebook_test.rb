require 'test_helper'

class UserLogsInWithFacebookTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = SnowAlert::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal edit_user_path(User.last), current_path
    assert page.has_content?("Matt Test")
    assert page.has_link?("Logout")
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
