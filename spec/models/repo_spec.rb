require 'rails_helper'

describe "Repo" do
  context "#by_user" do
    it "returns instance of Repo" do
      repos = Repo.by_user("annadolan")

      expect(repos).to be_a(Array)
      expect(repos.first).to be_a(Repo)
      expect(repos.first.repo_id).to be_truthy
    end
  end
end
