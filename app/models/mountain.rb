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


end
