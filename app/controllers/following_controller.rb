class FollowingController < ApplicationController
  def index
    @following = Profile.find_following(current_user.token)
  end
end
