class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = find_or_create_by(uid: auth_info[:uid])

    user.uid                = auth_info.uid
    user.name               = auth_info.extra.raw_info.name
    user.screen_name        = auth_info.extra.raw_info.login
    user.oauth_token        = auth_info.credentials.token
    user.oauth_token_secret = auth_info.credentials.secret
    user.save

    user
  end
end
