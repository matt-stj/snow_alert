class Mountain < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  def update_user

  end
end
