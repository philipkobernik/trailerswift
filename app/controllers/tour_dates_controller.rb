class TourDatesController < InheritedResources::Base
  belongs_to :tour

  respond_to :html, :json

  def create
    create! do |success, failure|
      success.html { redirect_to tour_tour_dates_url(@tour) }
      failure.html { redirect_to new_tour_tour_date_url(@tour) }
    end
  end

  def permitted_params
    params.permit(:tour_date => [:date, :city_state, :venue, :map_query, :ticket_url, :facebook_url, :lat, :lng])
  end

end
