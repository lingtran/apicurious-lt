class Starred < OpenStruct
  def self.service
    GithubService.new
  end

  def self.find_by(login)
    temp_starred_arr = service.starred_hash(login)
    temp_starred_arr.map do |nested_hash|
      Starred.new(nested_hash)
    end
  end

  def count_size(login)
    Starred.find_by(login).length
  end
end
