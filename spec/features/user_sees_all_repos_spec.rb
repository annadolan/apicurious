require 'rails_helper'

describe "A user sees all their repos" do
  context "they visit the repository path" do
    profile = Profile.find_user("annadolan")

    visit dashboard_repositories_path

  end
end
