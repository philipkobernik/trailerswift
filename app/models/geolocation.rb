class Geolocation
  attr_accessor :country, :state, :street, :city, :lat, :lng

  def initialize(ip)
    g = GeoIP.new File.join(Rails.root, "db", "GeoLiteCity.dat")
    geodata = g.city(ip)

    return unless geodata

    self.country = geodata[4]
    self.state = geodata[6]
    self.city = geodata[7]
    self.lat = geodata[9]
    self.lng = geodata[10]
  end

  def to_coordinates
    return [self.lat, self.lng]
  end
end
