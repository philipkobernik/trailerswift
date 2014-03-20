class ProfilesController < ApplicationController
  respond_to :html

  def show
    @profile = User.find_by_band_name!(params[:band_name])
    puts @profile.inspect

    load_resources_for @profile
  end

  def load_resources_for profile
    tour = profile.tours.find_or_create_by name: Settings.current_tour
    @locations = tour.locations.order('located_at ASC')

    if @locations.last
      @lat = @locations.last.lat
      @lng = @locations.last.lng
    end

    @tour_dates = tour.tour_dates
    @instagram_photos = tour.instagram_photos
  end
end

