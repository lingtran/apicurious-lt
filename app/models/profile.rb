class Profile < OpenStruct

  def self.service(user)
    GithubService.new(user.oauth_token)
  end

  def self.find_by(user)
    temp_profile_hash = Profile.service(user).profile_hash(user.screen_name)
    Profile.new(temp_profile_hash)
  end

  def join_date(user)
    creation = Profile.find_by(user).created_at.to_time
    creation.strftime("Joined on %b %d, %Y")
  end

  def starred_count(user)
     starred = Profile.service(user).starred_hash(user.screen_name)
     starred.length
  end

  def owner_repos(user)
    temp_owner_repos_arr = Profile.service(user).owner_repos_hash(user.screen_name)
    temp_owner_repos_arr.map do |owner_repo_hash|
      Profile.new(owner_repo_hash)
    end
  end

  def member_repos(user)
    temp_member_repos_arr = Profile.service(user).member_repos_hash(user.screen_name)
    temp_member_repos_arr.map do |member_repo_hash|
      Profile.new(member_repo_hash)
    end.take(5)
  end

  def all_sorted(user)
    temp_repos_arr = Profile.service(user).sorted_repos_with_contributions_hash(user.screen_name)
    temp_repos_arr.map do |repo_hash|
      Profile.new(repo_hash)
    end
  end

end
