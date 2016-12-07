class DashboardController < ApplicationController
  def index
    @user = Profile.find_user(current_user.username)
  end
end
