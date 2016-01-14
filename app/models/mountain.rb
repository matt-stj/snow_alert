class Mountain < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

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
