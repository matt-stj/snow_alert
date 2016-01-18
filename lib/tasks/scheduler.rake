desc "Heroku scheduler tasks"
task :alert_email => :environment do
  puts "Sending out email alerts to users."
  User.all.each do |user|
    UserMailer.alert(user).deliver_now
    sleep(5)
  end
  puts "Emails sent!"
end
