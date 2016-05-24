class HomeController < ApplicationController
  def index
    if current_user
      @profile = Profile.find_by(current_user.name)
    else
      @profile = Profile.new
    end
  end
end
