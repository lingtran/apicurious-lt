module OmniAuthHelpers
  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "1234",
      extra: {
        raw_info: {
          id: "1234",
          name: "Ling",
          login: "lingtran"
        }
      },
      credentials: {
        token: "chocolate",
        secret: "secretchocolate"
      }
      })
  end
end
