require 'rubygems'
require 'date'
require 'csv'
require 'json'

class DatesToJson

  def self.getJsonDates(path="dates.csv")
    dates_csv = CSV.read(path)
    dates_csv.shift # remove first row as it contains headers

    formatted_dates_array = []
    dates_csv.each do |row|
      date_hash = {}

      formatted_date = Date.strptime(row[0], "%Y-%m-%d")
      string_formatted_date = formatted_date.strftime("%d %b %Y")

      date_hash.merge! "date" => string_formatted_date

      city_state = "#{row[7]}, #{row[8]}" # city, state
      date_hash.merge! "city_state" => city_state

      venue = row[5]
      date_hash.merge! "venue" => venue # venue

      street_address = row[6] # street address

      if street_address
        maps_string = "#{street_address}, #{city_state}"
      else
        maps_string = "#{venue} near #{city_state}"
      end

      date_hash.merge! "map_url" => ("https://maps.google.com/maps?q=" << maps_string)

      date_hash.merge! "ticket_url" => row[15] # ticket url

      date_hash.merge! "facebook_url" => row[17] # ticket url

      formatted_dates_array.unshift date_hash
    end

    return formatted_dates_array

  end

end

