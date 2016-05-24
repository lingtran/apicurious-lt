module OmniAuthHelpers
  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:quizlet] = OmniAuth::AuthHash.new({
      provider: 'quizlet',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Ling",
          screen_name: "lingtran"
        }
      },
      credentials: {
        token: "chocolate",
        secret: "secretchocolate"
      }
    })
  end
end
