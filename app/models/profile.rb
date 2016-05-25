class Profile < OpenStruct
  def self.service
    GithubService.new
  end

  def self.find_by(login)
    temp_profile_hash = service.profile_hash(login)
    Profile.new(temp_profile_hash)
  end

  def join_date(login)
    creation = Profile.find_by(login).created_at.to_time
    creation.strftime("Joined on %b %d, %Y")
  end
end
