class LocationsController < InheritedResources::Base
  respond_to :html, :json

  belongs_to :tour

  def permitted_params
    params.permit(:location => [:lat, :lng, :located_at])
  end

end
