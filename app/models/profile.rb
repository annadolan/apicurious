class Profile
  attr_reader :name, :email, :followers, :following, :starred, :joined_date, :location

  def initialize(attributes={})
    @name = attributes[:name]
    @email = attributes[:email]
    @joined_date = attributes[:created_at]
    @location = attributes[:location]
  end

  def self.find_user(token)
    user = GithubService.new(token).get_user
    Profile.new(user)
  end
end
