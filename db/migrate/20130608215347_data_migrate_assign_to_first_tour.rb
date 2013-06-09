class DataMigrateAssignToFirstTour < ActiveRecord::Migration
  def up
    Tour.create!(:name => "Lines We Trace Spring Tour")
    TourDate.all.each do |td|
      td.tour_id = Tour.find_by_name("Lines We Trace Spring Tour").id
      td.save!
    end
  end

  def down
    TourDate.all.each do |td|
      td.tour_id = nil
      td.save!
    end
  end
end
