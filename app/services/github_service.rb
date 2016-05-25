class GithubService

  def initialize
    @connection = Faraday.new(url:"https://api.github.com/")
    @connection.headers["Authorization"] = "Token #{ENV['github_token']}"
  end

  def get_profile(login)
    @connection.get "users/#{login}"
  end

  def get_starred(login)
    @connection.get "users/#{login}/starred"
  end

  def get_member_repositories(login)
    @connection.get "users/#{login}/repos?type=member"
  end

  def get_owner_repositories(login)
    @connection.get "users/#{login}/repos"
  end

  def get_sorted_repositories_with_contributions(login)
      @connection.get "users/#{login}/repos?type=all&sort=updated"
  end

  def profile_hash(login)
    parse(get_profile(login))
  end

  def starred_hash(login)
    parse(get_starred(login))
  end

  def owner_repos_hash(login)
    parse(get_owner_repositories(login))
  end

  def member_repos_hash(login)
    parse(get_member_repositories(login))
  end

  def sorted_repos_with_contributions_hash(login)
    parse(get_sorted_repositories_with_contributions(login))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
