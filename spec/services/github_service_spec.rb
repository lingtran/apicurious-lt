require 'rails_helper'

describe GithubService do
  # before(:each) do
  #   # stub user?
  #   # assign
  #   @user
  #   @token = @user.oauth_token
  # end

  VCR.use_cassette("github_service#profile") do
  xit "returns a profile specific to user" do
  end
end
end
