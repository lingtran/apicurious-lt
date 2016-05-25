class Repositories < OpenStruct
  def self.service
    GithubService.new
  end

  def self.find_owner_repos(login)
    temp_owner_repos_hash = service.owner_repos_hash(login)
    temp_owner_repos_hash.map do |owner_repo_hash|
      Repositories.new(owner_repo_hash)
    end
  end

  def self.find_member_repos(login)
    temp_member_repos_hash = service.member_repos_hash(login)
    temp_member_repos_hash.map do |member_repo_hash|
      Repositories.new(member_repo_hash)
    end.take(5)
  end

  def self.find_all_sorted(login)
    temp_repos = service.sorted_repos_with_contributions_hash(login)
    temp_repos.map do |repo_hash|
      Repositories.new(repo_hash)
    end
  end
end
