Rails.application.config.middleware.use OmniAuth::Builder do
  provider :quizlet, ENV["QUIZLET_CLIENT_ID"], ENV["QUIZLET_SECRET_KEY"], :scope => "read write_set write_group", :state => "RANDOM_STRING"
end
