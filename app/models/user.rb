class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.image_url          = "https://graph.facebook.com/#{auth_info.uid}/picture?type=large"
      new_user.oauth_token        = auth_info.credentials.token
    end
  end

end
