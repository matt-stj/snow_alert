desc "Update mtns on the hour"
task :mtn_update => :environment do
  puts "Updating mountains"
  Mountain.all.each do |mountain|
    mountain.update_attributes(updated_at: Time.now)
  end
  puts "Mountains Updated!"
end
