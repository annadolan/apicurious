class Organization
  attr_reader :org_name, :org_url, :org_avatar
  def initialize(attributes={})
    @org_name = attributes[:login]
    @org_url = attributes[:url]
    @org_avatar = attributes[:avatar_url]
  end

  def self.by_user(token)
    service = GithubService.new(token).get_organizations
    orgs = service.map do |org|
      Organization.new(org)
    end
  end
end
