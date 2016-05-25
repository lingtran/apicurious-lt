class HomeController < ApplicationController
  def index
    if current_user
      @profile = Profile.find_by(current_user)
      # @starred = Starred.find_by(current_user.name)
      # @owner_repos = Repositories.find_owner_repos(current_user.name)
      # @member_repos = Repositories.find_member_repos(current_user.name)
      # @all_repos = Repositories.find_all_sorted(current_user.name)
    else
      @profile = Profile.new
      # @starred = Starred.new
      # @owner_repos = Repositories.new
      # @member_repos = Repositories.new
      # @all_repos = Repositories.new
    end
  end

  private

  # create methods that initialize other services or models and group them into an instance var that is a hash -- so want starred and repos
end
