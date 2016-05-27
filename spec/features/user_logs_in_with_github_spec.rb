require 'rails_helper'

RSpec.feature "User logs in with Github" do
  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

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
        token: ENV["github_token"],
        secret: "secretchocolate"
      }
      })
  end

  VCR.use_cassette "omniauth_login" do

    scenario "they can log in" do
      # how to pass use VCR cassettes for this?
      Capybara.app = ApicuriousLt::Application
      user = User.from_omniauth(stub_omniauth)

      # need to set up profile so that content can be rendered

      visit '/'
      expect(page).to have_http_status(200)
      within(".nav-bar") do
        click_link("Log in with Github")
      end
      expect(page).to have_current_path root_path
      expect(page).to have_content user.name
      expect(page).to have_link("Logout")
    end
  end
end
