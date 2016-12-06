require 'rails_helper'

describe "Profile" do
  context "#get_user" do
    it "returns a user's information" do
      user = Profile.find_user("annadolan")

      expect(user).to be_a(Profile)
      expect(user.name).to eq("Anna Dolan")
      expect(user.location).to eq("Denver, CO")
      expect(user.email).to eq(nil)
      expect(user.joined_date).to be_truthy
    end
  end
end
