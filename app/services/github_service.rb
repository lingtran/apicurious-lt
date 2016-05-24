class GithubService
  attr_reader :connection

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

  def profile_hash(login)
    parse(get_profile(login))
  end

  def starred_hash(login)
    parse(get_starred(login))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
