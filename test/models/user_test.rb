require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:favorites)
  should have_many(:mountains)

  should_not allow_value("blah").for(:email).on(:update)
  should_not allow_value("asldkh").for(:snow_preference).on(:update)
  should_not allow_value(0).for(:snow_preference).on(:update)
  should_not allow_value(21).for(:snow_preference).on(:update)
end
