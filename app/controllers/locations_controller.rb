class LocationsController < ResourcesController
  belongs_to :tour

  respond_to :html, :json

  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!, :unless => :session_logged_in?
  # This is Devise's authentication
  before_filter :authenticate_user!

  def attrs_for_index
    safe_params
  end

  def attrs_for_form
    safe_params
  end

  def permitted_params
    params.permit(:location => safe_params)
  end

  private
    def safe_params
      [:lat, :lng, :located_at, :reverse]
    end

end
