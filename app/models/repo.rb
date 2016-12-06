class Repo
  attr_reader :repo_id, :name, :language, :url

  def initialize(attributes={})
    @repo_id = attributes[:id]
    @name = attributes[:name]
    @language = attributes[:language]
    @url = attributes[:html_url]
  end

  def self.by_user(username)
    service = GithubService.new
    service.get_repos(username).map do |repo|
      Repo.new(repo)
    end
  end
end
