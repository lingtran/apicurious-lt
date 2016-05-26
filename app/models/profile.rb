class Profile < OpenStruct
  include ActionView::Helpers::DateHelper

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

  def all_repos_sorted(user)
    temp_repos_arr = Profile.service(user).sorted_repos_with_contributions_hash(user.screen_name)
    temp_repos_arr.map do |repo_hash|
      Profile.new(repo_hash)
    end
  end

  def all_orgs(user)
    temp_orgs_arr = Profile.service(user).orgs_hash(user.screen_name)
    temp_orgs_arr.map do |org_hash|
      Profile.new(org_hash)
    end
  end

  def all_commits(user)
     Profile.service(user).push_events_hash(user.screen_name).find_all do |event|
      event[:type] = "PushEvent"
    end.map do |commits_hash|
      Profile.new(commits_hash)
    end
  end

end
