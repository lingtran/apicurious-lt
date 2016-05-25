class GithubService
  # GithubService.new(current_user.token)

  def initialize(token)
    @connection = Faraday.new(url:"https://api.github.com/")
    @connection.headers["Authorization"] = "token #{token}"
  end

  def get_profile(screen_name)
    @connection.get "users/#{screen_name}"
  end

  def get_starred(screen_name)
    @connection.get "users/#{screen_name}/starred"
  end

  def get_member_repositories(screen_name)
    @connection.get "users/#{screen_name}/repos?type=member"
  end

  def get_owner_repositories(screen_name)
    @connection.get "users/#{screen_name}/repos"
  end

  def get_sorted_repositories_with_contributions(screen_name)
    @connection.get "users/#{screen_name}/repos?type=all&sort=updated"
  end

  def get_organizations(screen_name)
    @connection.get "user/orgs"
  end

  def profile_hash(screen_name)
    parse(get_profile(screen_name))
  end

  def starred_hash(screen_name)
    parse(get_starred(screen_name))
  end

  def owner_repos_hash(screen_name)
    parse(get_owner_repositories(screen_name))
  end

  def member_repos_hash(screen_name)
    parse(get_member_repositories(screen_name))
  end

  def sorted_repos_with_contributions_hash(screen_name)
    parse(get_sorted_repositories_with_contributions(screen_name))
  end

  def orgs_hash(screen_name)
    parse(get_organizations(screen_name))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
