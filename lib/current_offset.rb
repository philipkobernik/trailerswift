class CurrentOffset
  class << self

    def fetch
      return Settings.current_utc_offset unless Settings.current_utc_offset.nil?

      update_offset
    end

    def update_offset
      Settings.current_utc_offset = get_offset_hours
    end

    def get_offset_hours
      current_location = Location.current
      endpoint = "http://api.askgeo.com/v1/814/19f867fecfaa1c24467e974c444e6801b83f88720a477fd413647926f5a36621/query.json?points=#{current_location.lat}%2C#{current_location.lng}&databases=TimeZone"

      json_response = HTTParty.get endpoint

      return if json_response["code"] != 0

      timezone_data = json_response["data"][0]["TimeZone"]

      timezone_data["CurrentOffsetMs"]/(60*60*1000)
    end

  end
end