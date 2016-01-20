desc "Heroku scheduler tasks"
task :alert_email => :environment do
  puts "Sending out email alerts to users."
  User.all.each do |user|
    UserMailer.alert(user).deliver_now
    p "Email sent to #{user.name}"
  end
  puts "All emails sent!"
end
