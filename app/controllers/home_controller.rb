class HomeController < ApplicationController
  def index
    @feed = Event.received_by_user(current_user.token, current_user.username) if logged_in?
  end
end
