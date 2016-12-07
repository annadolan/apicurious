require 'rails_helper'

describe "Event" do
  context "#find_by_user" do
    it "returns a user's events feed" do
      VCR.use_cassette("#find_by_user") do
        token = ENV["github_user_token"]
        events = Event.find_by_user(token, "annadolan")
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to be_an(Event)
      end
    end
  end
end
