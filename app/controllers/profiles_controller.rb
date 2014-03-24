class ProfilesController < ApplicationController
  respond_to :html

  def show
    @profile = User.find_by_band_slug!(params[:band_slug])

    tours = @profile.tours.order('created_at ASC')
    redirect_to tours.last
  end
end

