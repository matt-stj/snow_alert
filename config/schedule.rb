# every 1.day, :at => '12:00 pm' do
#   rake "timesheet:check"
# end

every 50.minutes do
  runner "UserMailer.alert(User.first).deliver_now"
end
