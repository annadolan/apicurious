class Profile
  attr_reader :name, :email, :followers, :following, :starred, :joined_date, :location

  def initialize(attributes={})
    @name = attributes[:name]
    @email = attributes[:email]
    @joined_date = attributes[:created_at]
    @location = attributes[:location]
  end

  def self.find_user(current_username)
    user = GithubService.new.get_user(current_username)
    Profile.new(user)
  end
end
