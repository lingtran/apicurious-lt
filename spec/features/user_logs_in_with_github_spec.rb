require 'rails_helper'

RSpec.feature "User logs in with Github" do

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
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

  scenario "they can log in" do

    Capybara.app = ApicuriousLt::Application
    stub_omniauth

    visit '/'
    expect(page).to have_http_status(200)
    within(".nav-bar") do
      click_link("Log in with Github")
    end
    expect(page).to have_current_path root_path
    expect(page).to have_content "Ling"
    expect(page).to have_link("Logout")
  end
end
