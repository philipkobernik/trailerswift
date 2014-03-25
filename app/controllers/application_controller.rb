class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :null_session

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render file: File.join(Rails.root, 'public', '404.html'), status: 404, layout: false
  end

  def session_logged_in?
    current_user.present?
  end

  def after_sign_in_path_for(resource)
    tours_path
  end

  def geolocation_target
    return "google.com" if ["development", "test"].include? Rails.env

    return request.remote_ip
  end

  helper_method :session_logged_in?

  private

  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.
  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)

    # Notice we are passing store false, so the user is not
    # actually stored in the session and a token is needed
    # for every request. If you want the token to work as a
    # sign in token, you can simply remove store: false.
    if user && Devise.secure_compare(user.auth_token, params[:user_token])
      sign_in user, store: false
    end

  end
end

