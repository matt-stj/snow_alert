desc "Heroku scheduler tasks"
task :alert_email => :environment do
  puts "Sending out email alerts to users."
  UserMailer.alert(User.first).deliver
  puts "Emails sent!"
end
