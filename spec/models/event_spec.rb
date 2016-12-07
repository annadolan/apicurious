require 'rails_helper'

describe "Event" do
  context "#received_by_user" do
    it "returns a user's received events" do
      VCR.use_cassette("#received_by_user") do
        token = ENV["github_user_token"]
        events = Event.received_by_user(token, "annadolan")
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to be_an(Event)
      end
    end
  end

  context "#performed_by_user" do
    it "returns a user's performed events" do
      VCR.use_cassette("#performed_by_user") do
        token = ENV["github_user_token"]
        events = Event.performed_by_user(token, "annadolan")
        event = events.first

        expect(events).to be_an(Array)
        expect(event).to be_an(Event)
      end
    end
  end
end
