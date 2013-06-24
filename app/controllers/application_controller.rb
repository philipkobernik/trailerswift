class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def geolocation_target
    return "google.com" if ["development", "test"].include? Rails.env

    return request.remote_ip
  end
end
