require 'test_helper'

class GeocodeTest < ActiveSupport::TestCase
  test "A Geocode object has geographic attributes" do
    location = Geocode.new("Vail, CO")

    assert_equal "Colorado", location.state
    assert_equal -106.3741955, location.longitude
    assert_equal 39.6402638, location.latitude
  end

end
