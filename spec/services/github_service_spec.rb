require 'rails_helper'

describe "GithubService" do
  context "#get_repos" do
    it "returns an array of JSON objects" do
      repos = GithubService.new.get_repos("annadolan")

      expect(repos.class).to eq(Array)
      expect(repos.first).to have_key(:id)
      expect(repos.first).to have_key(:owner)
      expect(repos.first).to have_key(:name)
      expect(repos.first).to have_key(:language)
      expect(repos.first).to have_key(:html_url)
    end
  end
end
