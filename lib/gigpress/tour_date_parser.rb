module Gigpress
  class TourDateParser

    def self.read(file_name="dates.csv")
      dates_csv = CSV.read(File.join("/src","trailerswift", "db", "tour_dates", file_name))
      dates_csv.shift # remove first row as it contains headers

      formatted_dates_array = []
      dates_csv.each do |row|
        date_hash = {}

        formatted_date = DateTime.strptime("#{row[0]}T#{row[1]}", "%Y-%m-%dT%H:%M:%S")
        #string_formatted_date = formatted_date.strftime("%d %b %Y")

        date_hash.merge! :date => formatted_date

        city_state = "#{row[7]}, #{row[8]}" # city, state
        date_hash.merge! :city_state => city_state

        venue = row[5]
        date_hash.merge! :venue => venue # venue

        street_address = row[6] # street address

        if street_address
          maps_string = "#{street_address}, #{city_state}"
        else
          maps_string = "#{venue} near #{city_state}"
        end

        date_hash.merge! :map_query => maps_string

        date_hash.merge! :ticket_url => row[15] # ticket url

        date_hash.merge! :facebook_url => row[17] # ticket url

        date_hash.merge! :lat => row[23].to_f unless row[23].nil?
        date_hash.merge! :lng => row[24].to_f unless row[24].nil?

        formatted_dates_array.unshift date_hash
      end

      puts formatted_dates_array
      return formatted_dates_array

    end
  end
end