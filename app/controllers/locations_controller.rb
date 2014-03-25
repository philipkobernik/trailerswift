class LocationsController < InheritedResources::Base
  respond_to :html, :json

  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!, :unless => :session_logged_in?
  # This is Devise's authentication
  before_filter :authenticate_user!

  belongs_to :tour

  def permitted_params
    params.permit(:location => [:lat, :lng, :located_at])
  end

end
