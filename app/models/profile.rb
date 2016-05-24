class Profile < OpenStruct
  def self.service
    GithubService.new
  end

  def self.find_by(username)
    temp_profile_hash = service.profile_hash(username)
    Artist.new(temp_profile_hash)
  end

  def save
    Artist.service.create_profile(self.to_h)
  end
end
