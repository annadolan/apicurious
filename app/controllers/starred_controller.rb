class StarredController < ApplicationController
  def index
    @starred = Repo.starred(current_user.token)
  end
end
