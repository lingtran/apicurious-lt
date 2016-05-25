module ApplicationHelper
  def html_url(url)
    url.gsub("api.github.com/orgs/", "github.com/")
  end
end
