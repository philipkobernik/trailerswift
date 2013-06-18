Instagram::Configuration::DEFAULT_REDIRECT_URI = Settings.instagram.redirect_uri

Instagram.configure do |config|
  config.client_id = Settings.instagram.id
  config.client_secret = Settings.instagram.secret
end
