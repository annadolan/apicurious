class GithubService
  attr_reader :response
  
  def get_repos(username)
    @response = Faraday.get("https://api.github.com/users/#{username}/repos?client_id=#{ENV["github_client_id"]}&client_secret=#{ENV["github_client_secret"]}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
