class Profile
  attr_reader :name, :email, :followers, :following, :starred, :joined_date, :location, :username, :avatar

  def initialize(attributes={})
    @name = attributes[:name]
    @email = attributes[:email]
    @joined_date = attributes[:created_at]
    @location = attributes[:location]
    @username = attributes[:login]
    @avatar = attributes[:avatar_url]
  end

  def self.find_user(token)
    user = GithubService.new(token).get_user
    Profile.new(user)
  end

  def self.find_followers(token)
    user = GithubService.new(token)
    followers = user.get_followers
    followers.map do |follower|
      follower_info = user.get_unauthenticated_user(follower[:login])
      Profile.new(follower_info)
    end
  end

  def self.find_following(token)
    user = GithubService.new(token)
    following = user.get_following
    following.map do |follow|
      following_info = user.get_unauthenticated_user(follow[:login])
      Profile.new(following_info)
    end
  end
end
