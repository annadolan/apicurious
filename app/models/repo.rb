class Repo
  attr_reader :repo_id, :name, :full_name, :description, :language, :url, :updated

  def initialize(attributes={})
    @repo_id = attributes[:id]
    @name = attributes[:name]
    @full_name = attributes[:full_name]
    @description = attributes[:description]
    @language = attributes[:language]
    @url = attributes[:html_url]
    @updated = attributes[:updated_at]
  end

  def self.by_user(token)
    service = GithubService.new(token).get_repos
    mapped = service.map do |repo|
      Repo.new(repo)
    end
    mapped.sort! { |a,b| b.updated <=> a.updated }
  end

  def self.starred(token)
    user = GithubService.new(token)
    starred = user.get_starred
    stars = starred.map do |star|
      Repo.new(star)
    end
  end
end
