class CreateJulyAugustTour < ActiveRecord::Migration
  def up
    Location.all.each do |loc|
      if (Date.new(2013, 7, 9)...Date.new(2013, 8, 20)).include?(loc.located_at)
        loc.tour = Tour.find_or_create_by(name: "Lines We Trace July-August")
      end
      loc.save!
    end

    TourDate.all.each do |td|
      if (Date.new(2013, 7, 9)...Date.new(2013, 8, 20)).include?(td.date)
        td.tour = Tour.find_or_create_by(name: "Lines We Trace July-August")
      end
      td.save!
    end
  end

  def down
    Tour.find_or_create_by(name: "Lines We Trace July-August").locations.each do |loc|
      loc.tour = "Lines We Trace Midwest Madness Tour"

      loc.save!
    end
    Tour.find_or_create_by(name: "Lines We Trace July-August").tour_dates.each do |td|
      td.tour = "Lines We Trace Midwest Madness Tour"

      td.save!
    end
  end
end
