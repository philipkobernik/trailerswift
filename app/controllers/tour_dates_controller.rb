class TourDatesController < ApplicationController

  inherit_resources

  respond_to :json

  def permitted_params
    #params.require(:tour_date).permit(:date, :city_state, :venue, :map_query, :ticket_url, :facebook_url)
    #params.permit(:date, :city_state, :venue, :map_query, :ticket_url, :facebook_url)
    params.permit!
  end

end
