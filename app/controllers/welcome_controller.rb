class WelcomeController < ApplicationController
  def index
    @locations = Location.all

    @lat = @locations.last.lat
    @lng = @locations.last.lng

    @tour_dates = TourDate.all

    render 'welcome/index'
  end
end
