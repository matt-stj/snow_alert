class User < ActiveRecord::Base
  has_many :favorites
  has_many :resorts, through: :favorites
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :update }
  validates :email, uniqueness: true, on: :update
  validates :snow_preference, numericality: true, on: :update
  validates :snow_preference, :inclusion => { :in => 1..20, :message => "Snowfall should be between 1 to 20" }, on: :update

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.image_url          = "https://graph.facebook.com/#{auth_info.uid}/picture?type=large"
      new_user.oauth_token        = auth_info.credentials.token
    end
  end

  def favorited?(mountain_id)
    self.favorites.exists?(mountain_id: mountain_id)
  end

  def add_favorite(mountain_id)
    self.favorites.create(mountain_id: mountain_id)
  end

  def remove_favorite(mountain_id)
    self.favorites.find_by(mountain_id: mountain_id).delete
  end

  def update(params)
    if params['user']
      update_attributes(email: params['user']['email'],
                                 snow_preference: params['user']['snow_preference'])
    elsif params['favorite_action'].keys.first == 'remove'
      remove_favorite(params['favorite_action'].fetch('remove'))
    else
      add_favorite(params['favorite_action'].fetch('add'))
    end
  end

  private



end
