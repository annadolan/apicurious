class DashboardController < ApplicationController
  def index
    @user = Profile.find_user(current_user.username)
    @repos = Repo.by_user(current_user.token)
  end
end
