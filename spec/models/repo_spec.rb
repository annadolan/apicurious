require 'rails_helper'

describe "Repo" do
  context ".by_user(token)" do
    it "returns repos for a user" do
      VCR.use_cassette(".by_user") do
        repos = Repo.by_user(ENV["github_user_token"])
        repo = repos.first

        expect(repos).to be_a(Array)
        expect(repo).to be_a(Repo)
        expect(repo).to respond_to(:repo_id)
        expect(repo).to respond_to(:name)
        expect(repo).to respond_to(:language)
        expect(repo).to respond_to(:url)
      end
    end
  end

  context ".starred(token)" do
    it "returns starred repos for a user" do
      VCR.use_cassette(".starred") do
        repos = Repo.starred(ENV["github_user_token"])
        repo = repos.first

        expect(repos).to be_a(Array)
        expect(repo).to be_a(Repo)
        expect(repo).to respond_to(:repo_id)
        expect(repo).to respond_to(:name)
        expect(repo).to respond_to(:language)
        expect(repo).to respond_to(:url)
      end
    end
  end
end
