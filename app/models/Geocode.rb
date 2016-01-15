class Geocode
  attr_reader :raw_data
  attr_accessor :latitude, :longitude, :name

  def initialize(query)
    @raw_data = Geocoder.search(query)
    @latitude = ""
    @longitude = ""
    @name = ""
  end

  def assign_values
    set_name
    [set_latitude, set_longitude]
  end

  def set_latitude
    self.latitude = raw_data.first.data.fetch("geometry").fetch("location").fetch("lat")
  end

  def set_longitude
    self.latitude = raw_data.first.data.fetch("geometry").fetch("location").fetch("lng")
  end

  def set_name
    self.name = raw_data.first.data.fetch("address_components").first.fetch("long_name")
  end

  def closest_mountain(latitude, longitude)
    trunc_latitude = truncate_coordinate(latitude)
    truncate_longitude = truncate_coordinate(longitude)
    Mountain.where("latitude LIKE :latitude", latitude: "%#{trunc_latitude}%").where("longitude LIKE :longitude", longitude: "%#{truncate_longitude}%")
  end

  def truncate_coordinate(coordinate)
    string = sprintf "%.3f", coordinate
    string[0..(string.length - 2)]
  end

end
