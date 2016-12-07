class GithubService
  def initialize(token)
    @token = token
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def get_user
    response = conn.get("/user")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_unauthenticated_user(login)
    response = conn.get("/users/#{login}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_repos
    response = conn.get("/user/repos")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_followers
    response = conn.get("/user/followers")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_following
    response = conn.get("/user/following")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :token, :conn
end
