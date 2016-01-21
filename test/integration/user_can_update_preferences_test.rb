require 'test_helper'

class UserCanUpdatePreferencesTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  
  def setup
    Capybara.app = SnowAlert::Application
    stub_omniauth
  end

  test "user updates with vaild attributes" do
    visit "/"
    click_link "Login"

    visit edit_user_path(User.last)

    fill_in('user[email]', :with => 'hi@gmail.com')
    fill_in('user[snow_preference]', :with => '1')

    click_button('Save Changes')


    assert page.has_content?("Your preferences have been updated!")
    assert_equal "hi@gmail.com", User.last.email
    assert_equal 1, User.last.snow_preference
  end

  test "user cannot update with invaild email" do
    visit "/"
    click_link "Login"

    visit edit_user_path(User.last)

    fill_in('user[email]', :with => 'blah')
    fill_in('user[snow_preference]', :with => '1')

    click_button('Save Changes')

    assert_equal edit_user_path(User.last), current_path
    assert page.has_content?("There was an error, please try again. Email is invalid")
  end

  test "user must insert integer for snow preference" do
    visit "/"
    click_link "Login"

    visit edit_user_path(User.last)

    fill_in('user[email]', :with => 'hi@gmail.com')
    fill_in('user[snow_preference]', :with => 'not-a-number')

    click_button('Save Changes')

    assert_equal edit_user_path(User.last), current_path
    assert page.has_content?("There was an error, please try again. Snow preference is not a number, Snow preference Snowfall should be between 1 to 20")
  end


end
