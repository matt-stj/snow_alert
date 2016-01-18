class Geocode
  attr_reader :raw_data
  attr_accessor :latitude, :longitude, :name, :state

  def initialize(query)
    @raw_data = Geocoder.search(query).first
    @latitude = raw_data.latitude
    @longitude = raw_data.longitude
    @state = raw_data.state
  end

  # def closest_mountain(latitude, longitude)
  #   trunc_latitude = truncate_coordinate(latitude)
  #   truncate_longitude = truncate_coordinate(longitude)
  #   Mountain.where("latitude LIKE :latitude", latitude: "%#{trunc_latitude}%").where("longitude LIKE :longitude", longitude: "%#{truncate_longitude}%")
  # end
  #
  # def truncate_coordinate(coordinate)
  #   string = sprintf "%.3f", coordinate
  #   string[0..(string.length - 3)]
  # end

end
