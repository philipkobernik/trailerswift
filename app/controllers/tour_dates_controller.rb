class TourDatesController < ResourcesController
  belongs_to :tour

  respond_to :html, :json

  def attrs_for_index
    safe_params
  end

  def attrs_for_form
    safe_params
  end

  def create
    create! do |success, failure|
      success.html { redirect_to tour_tour_dates_url }
      failure.html { render(action: 'new') }
    end
  end

  def permitted_params
    params.permit(:tour_date => safe_params)
  end

  private
    def safe_params
      [:date, :city_state, :venue, :map_query, :ticket_url, :facebook_url, :lat, :lng]
    end
end
