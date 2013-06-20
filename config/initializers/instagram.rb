Instagram::Configuration::DEFAULT_REDIRECT_URI = Settings.instagram.redirect_uri

Instagram.configure do |config|
  config.client_id = ENV['instagram_id']
  config.client_secret = ENV['instagram_secret']
end
