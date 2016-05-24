class Starred < OpenStruct
  def self.service
    GithubService.new
  end

  def self.find_by(login)
    temp_starred_hash = service.starred_hash(login)
    Starred.new(temp_starred_hash)
  end

  def count(profile)
    starred = Starred.find_by(profile)
    starred.length
  end
end
