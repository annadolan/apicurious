module ApplicationHelper
  def organizations
    Organization.by_user(current_user.token)
  end

  def stars_count
    Repo.starred(current_user.token).count
  end

  def followers_count
    Profile.find_followers(current_user.token).count
  end

  def following_count
    Profile.find_following(current_user.token).count
  end

  def repo_count
    Repo.by_user(current_user.token).count
  end
end
