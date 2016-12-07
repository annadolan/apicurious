class RepoController < ApplicationController
  def index
    @repos = Repo.by_user(current_user.username)
  end
end
