class TourDatesController < ResourcesController
  # inherited_resources config
  belongs_to :tour
  respond_to :html, :json

  # cancan loading & authorization
  load_resource :tour
  load_and_authorize_resource :tour_date, :through => :tour


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

  def import
    @import_results = @tour.import_gigpress_dates(params[:file])
    render action: 'index'
  end

  def permitted_params
    params.permit(:tour_date => safe_params)
  end

  private
    def safe_params
      [:date, :city_state, :venue, :map_query, :ticket_url, :facebook_url, :lat, :lng]
    end
end
