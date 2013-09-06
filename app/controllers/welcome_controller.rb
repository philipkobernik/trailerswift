class WelcomeController < ApplicationController
  def index
    tour = Tour.find_or_create_by name: Settings.current_tour
    @locations = tour.locations.order('located_at ASC')

    if @locations.last
      @lat = @locations.last.lat
      @lng = @locations.last.lng
    end

    @tour_dates = tour.tour_dates
    @instagram_photos = tour.instagram_photos

    render 'welcome/index'
  end
end
