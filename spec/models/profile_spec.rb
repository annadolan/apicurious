require 'rails_helper'

describe "Profile" do
  context "#find_user" do
    it "returns a user's information" do
      VCR.use_cassette("#find_user") do
        token = ENV["github_user_token"]
        user = Profile.find_user(token)

        expect(user).to be_a(Profile)
        expect(user.name).to eq("Anna Dolan")
        expect(user.location).to eq("Denver, CO")
        expect(user.email).to eq(nil)
        expect(user).to respond_to(:joined_date)
      end
    end
  end

  context "#find_followers" do
    it "returns details on a user's followers" do
      VCR.use_cassette("find_followers") do
        token = ENV["github_user_token"]
        followers = Profile.find_followers(token)
        follower = followers.first

        expect(followers).to be_an(Array)
        expect(follower).to be_a(Profile)
      end
    end
  end

  context "#find_following" do
    it "returns details on a user's following" do
      VCR.use_cassette("find_following") do
        token = ENV["github_user_token"]
        following = Profile.find_following(token)
        follow = following.first

        expect(following).to be_an(Array)
        expect(follow).to be_a(Profile)
      end
    end
  end
end
