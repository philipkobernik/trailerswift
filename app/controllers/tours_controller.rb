class ToursController < InheritedResources::Base
  respond_to :html, :json

  def begin_of_association_chain
    current_user
  end

  def create
    create! { edit_tour_url(@tour) }
  end

  def permitted_params
    params.permit(:tour => [:name])
  end

end
