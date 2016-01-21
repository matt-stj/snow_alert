require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send email" do
    VCR.use_cassette('forecast_io_service#forecast') do

      user = User.create!(name: "Matt", email: "test@test.com", snow_preference: 1)
      mountain = Mountain.create!(name: "Mountain", latitude: 39.523, longitude: -104.325)
      user.favorites.create!(mountain_id: mountain.id)

     email = UserMailer.alert(user)

     assert_emails 1 do
       email.deliver_now
     end

     assert_equal ['gnarpow.info@gmail.com'], email.from
     assert_equal ['test@test.com'], email.to
     assert_equal 'Snow is on the way!', email.subject
     assert_includes(email.body.to_s, "Mountain")
     assert_includes(email.body.to_s, "Sun, Jan 24")
     assert_includes(email.body.to_s, '1"')
   end
 end
end
