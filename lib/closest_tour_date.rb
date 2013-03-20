class ClosestTourDate
  def self.from location
    distances = {}
    TourDate.upcoming.each do |tour_date|
      distance = Geocoder::Calculations.distance_between location, tour_date
      distances.merge! distance => tour_date.id
    end

    return distances.min
  end
end
