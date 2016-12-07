require 'rails_helper'

describe "Organization" do
  context ".by_user" do
    it "returns organizations for a user" do
      VCR.use_cassette(".orgs_by_user") do
        orgs = Organization.by_user(ENV["github_user_token"])
        org = orgs.first

        expect(orgs).to be_a(Array)
        expect(org).to be_a(Organization)
        expect(org).to respond_to(:org_name)
        expect(org).to respond_to(:org_url)
        expect(org).to respond_to(:org_avatar)
      end
    end
  end
end
