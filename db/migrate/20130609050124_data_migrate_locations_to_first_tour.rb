class DataMigrateLocationsToFirstTour < ActiveRecord::Migration
  def up
    Location.all.each do |loc|
      if loc.tour.nil? && (Date.new(2013, 2, 20)...Date.new(2013, 4, 18)).include?(loc.located_at)
        loc.tour = Tour.find_or_create_by(name: "Lines We Trace Spring Tour")
      elsif loc.tour.nil? && (Date.new(2013, 6, 8)...Date.new(2013, 7, 4)).include?(loc.located_at)
        loc.tour = Tour.find_or_create_by(name: "Lines We Trace Midwest Madness Tour")
      end

      loc.save!
    end

  end
  def down
    Location.each do |loc|
      loc.tour = nil

      loc.save!
    end
  end
end
