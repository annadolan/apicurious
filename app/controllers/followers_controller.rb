class FollowersController < ApplicationController
  def index
    @followers = Profile.find_followers(current_user.token)
  end
end
