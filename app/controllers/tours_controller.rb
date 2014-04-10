class ToursController < InheritedResources::Base
  respond_to :html, :json

  load_and_authorize_resource :tour, except: [:show, :index]

  #def begin_of_association_chain
    #current_user
  #end

  def index
    redirect_to root_path unless session_logged_in?
    @tours = Tour.accessible_by(current_ability, :update)
  end

  def create
    create! { edit_tour_url(@tour) }
  end

  def permitted_params
    params.permit(:tour => [:name])
  end

end
