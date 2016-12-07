require 'rails_helper'

describe "GithubService" do
  context "#get_repos" do
    it "returns an array of repositories as JSON objects" do
      VCR.use_cassette("#get_repos") do
        repos = GithubService.new(ENV["github_user_token"]).get_repos
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repo).to have_key(:id)
        expect(repo).to have_key(:owner)
        expect(repo).to have_key(:name)
        expect(repo).to have_key(:language)
        expect(repo).to have_key(:html_url)
      end
    end
  end
  context "#get_user" do
    it "returns a single user" do
      VCR.use_cassette("#get_user") do
        user = GithubService.new(ENV["github_user_token"]).get_user
        expect(user).to be_a(Hash)
        expect(user[:login]).to eq("annadolan")
      end
    end
  end

  context "#get_unauthenticated_user" do
    it "returns a single user" do
      VCR.use_cassette("#get_unauthenticated_user") do
        user = GithubService.new(ENV["github_user_token"]).get_unauthenticated_user("annadolan")
        expect(user).to be_a(Hash)
        expect(user[:login]).to eq("annadolan")
      end
    end
  end

  context "#get_followers" do
    it "returns a user's followers" do
      VCR.use_cassette("#get_followers") do
        followers = GithubService.new(ENV["github_user_token"]).get_followers
        follower = followers.first

        expect(followers).to be_an(Array)
        expect(follower).to have_key(:login)
        expect(follower).to have_key(:avatar_url)
        expect(follower).to have_key(:html_url)
        expect(follower).to have_key(:id)
      end
    end
  end

  context "#get_following" do
    it "returns a user's following" do
      VCR.use_cassette("#get_following") do
        following = GithubService.new(ENV["github_user_token"]).get_following
        follow = following.first

        expect(following).to be_an(Array)
        expect(follow).to have_key(:login)
        expect(follow).to have_key(:avatar_url)
        expect(follow).to have_key(:html_url)
        expect(follow).to have_key(:id)
      end
    end
  end

  context "#get_starred" do
    it "returns a user's starred repos" do
      VCR.use_cassette("#get_starred") do
        starred = GithubService.new(ENV["github_user_token"]).get_starred
        star = starred.first

        expect(starred).to be_an(Array)
        expect(star).to have_key(:name)
        expect(star).to have_key(:owner)
      end
    end
  end

  context "#get_events(username)" do
    it "returns a user's events" do
      VCR.use_cassette("#get_events") do
        events = GithubService.new(ENV["github_user_token"]).get_events("annadolan")
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to have_key(:type)
        expect(event).to have_key(:actor)
        expect(event).to have_key(:repo)
      end
    end
  end
end
