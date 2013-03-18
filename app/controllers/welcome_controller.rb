class WelcomeController < ApplicationController
  def index
    @locations = Location.all

    @lat = @locations.last.lat
    @lng = @locations.last.lng

    @tour_dates = TourDate.all

    @user_location = Geolocation.new(request.ip)

    render 'welcome/index'
  end
end
