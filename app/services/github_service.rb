class GithubService
  def initialize
    @connection = Faraday.new(url:"https://api.github.com/")
    @connection.headers["Authorization"] = "Token #{ENV['github_token']}"
  end

  def get_profile(username)
    @connection.get "users/#{username}"
  end

  def profile_hash(username)
    parse(get_profile(username))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
