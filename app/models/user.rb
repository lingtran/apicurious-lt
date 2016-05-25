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

    # where(uid: auth_info[:uid]).first_or_create do |new_user|
    #   new_user.uid                = auth_info.uid
    #   new_user.name               = auth_info.extra.raw_info.name
    #   new_user.screen_name        = auth_info.extra.raw_info.screen_name
    #   new_user.oauth_token        = auth_info.credentials.token
    #   new_user.oauth_token_secret = auth_info.credentials.secret
    # end
  end

  # need to update with new token
end
