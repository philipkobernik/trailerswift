class WelcomeController < ApplicationController
  def index
    @locations = Location.all
    @lat = @locations.last.lat
    @lng = @locations.last.lng

    render 'welcome/index'
  end
end
