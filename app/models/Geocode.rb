class Geocode
  attr_reader :raw_data
  attr_accessor :latitude, :longitude, :name, :state

  def initialize(query)
    @raw_data = Geocoder.search(query).first
    @latitude = raw_data.latitude
    @longitude = raw_data.longitude
    @state = raw_data.state
  end


end
