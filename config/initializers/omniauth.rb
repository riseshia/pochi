Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['AUTH_KEY'], ENV['AUTH_SECRET']
end
