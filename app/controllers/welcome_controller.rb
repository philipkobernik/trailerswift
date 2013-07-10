class WelcomeController < ApplicationController
  def index
    @locations = Tour.find_by_name(Settings.current_tour).locations.order('located_at ASC')

    @lat = @locations.last.lat
    @lng = @locations.last.lng

    @tour_dates = Tour.find_by_name(Settings.current_tour).tour_dates
    @instagram_photos = Tour.find_by_name(Settings.current_tour).instagram_photos

    render 'welcome/index'
  end
end
