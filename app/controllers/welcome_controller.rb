class WelcomeController < ApplicationController
  def index
    @locations = Location.order('located_at ASC')

    @lat = @locations.last.lat
    @lng = @locations.last.lng

    @tour_dates = TourDate.all

    @user_location = current_location = Geolocation.new(geolocation_target)

    @closest_tour_date = ClosestTourDate.from current_location

    center = Geocoder::Calculations.geographic_center [@user_location, @locations.last, TourDate.find(@closest_tour_date[1])]
    user_to_center = Geocoder::Calculations.distance_between center, current_location
    @bounding_box = Geocoder::Calculations.bounding_box(center, (user_to_center * 1.3))

    render 'welcome/index'
  end
end
