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
  end

  test "adding additional profile info" do
    visit '/'
    click_link "Login"

    fill_in('user[email]', :with => 'hi@gmail.com')
    fill_in('user[snow_preference]', :with => '1')
    click_button('Save Changes')

    assert_equal "hi@gmail.com", User.last.email
    assert_equal 1, User.last.snow_preference
  end

  test "an existing user will be redirected to their dash" do
    user = User.create(name: "Matt", uid: "12345")
    visit '/'
    click_link "Login"

    assert_equal user_path(user), current_path
  end


  test "logging out" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"

    within('.right') do
      refute page.has_content?("Login")
    end

    click_link("Log out")
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
