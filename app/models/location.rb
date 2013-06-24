class Location < ActiveRecord::Base
  belongs_to :tour

  validates :located_at, :uniqueness => true

  def to_coordinates
    return [self.lat, self.lng]
  end

  def self.fetch
    latitude_endpoint = "http://www.google.com/latitude/apps/badge/api?user=#{ENV['latitude_id']}&type=json" 
    loc = HTTParty.get latitude_endpoint

    if loc and loc["features"] and location = loc["features"][0]
      new_location = self.new

      # Fetch lat lng
      if location["geometry"] and coords = location["geometry"]["coordinates"]
        new_location.lng, new_location.lat = coords[0], coords[1]
      end

      # Fetch time and reverse
      if properties = location["properties"]
        new_location.located_at = Time.at(properties["timeStamp"]).to_datetime if properties["timeStamp"]
        new_location.reverse = properties["reverseGeocode"] if properties["reverseGeocode"]
      end

      new_location.tour = Tour.find_by_name(Settings.current_tour)

      new_location.save
    end
  end
end
