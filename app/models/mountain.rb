require 'geocoder'

class Mountain < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  def self.state(state)
    where(state: state)
  end

  def self.sort_state_codes
    self.group(:state).count.keys.sort_by { |k| k }
  end


  # def search(query)
  #   raw_data = Geocoder.search(query)
  #   latitude = raw_data.first.data.fetch("geometry").fetch("location").fetch("lat")
  #   longitude = raw_data.first.data.fetch("geometry").fetch("location").fetch("lng")
  #   Weather.new(latitude, longitude)
  # end


end
