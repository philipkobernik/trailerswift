class WelcomeController < ApplicationController
  def index
    @locations = Location.order('located_at ASC')

    @lat = @locations.last.lat
    @lng = @locations.last.lng

    @tour_dates = TourDate.all

    render 'welcome/index'
  end
end
