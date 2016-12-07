require 'rails_helper'

describe "GithubService" do
  context "#get_repos" do
    it "returns an array of repositories as JSON objects" do
      repos = GithubService.new(ENV["github_user_token"]).get_repos
      repo = repos.first

      expect(repos).to be_a(Array)
      expect(repo).to have_key(:id)
      expect(repo).to have_key(:owner)
      expect(repo).to have_key(:name)
      expect(repo).to have_key(:language)
      expect(repo).to have_key(:html_url)
    end
  end
  context "#get_user" do
    it "returns a single user" do
      user = GithubService.new(ENV["github_user_token"]).get_user
      expect(user).to be_a(Hash)
      expect(user[:login]).to eq("annadolan")
    end
  end
end
