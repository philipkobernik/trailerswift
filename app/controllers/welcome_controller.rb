class WelcomeController < ApplicationController
  def index
    @locations = Location.all

    @lat = @locations.last.lat
    @lng = @locations.last.lng

    @tour_dates = TourDate.all

    @user_location = current_location = Geolocation.new("google.com")

    @closest_tour_date = ClosestTourDate.from current_location

    render 'welcome/index'
  end
end
