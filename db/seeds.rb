require 'csv'

resorts_path = "#{Rails.root}/lib/assets/resorts.csv"
resort_rows = CSV.readlines(resorts_path, headers: true, header_converters: :symbol)

resort_rows.each do |row|
  latitude = row.fetch(:geometry).split(">")[2].split(",")[1]
  longitude = row.fetch(:geometry).split(">")[2].split(",")[0]

  name = row.fetch(:name)
  state = Geocoder.search("#{latitude}, #{longitude}").first.state_code

  mountain = Mountain.create!(name: name, latitude: latitude, longitude: longitude, state: state )

  puts "created mountain: #{mountain.name}, #{mountain.state}: #{mountain.latitude}, #{mountain.longitude}"

  sleep(1)
end
