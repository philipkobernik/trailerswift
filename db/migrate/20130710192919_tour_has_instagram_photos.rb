class TourHasInstagramPhotos < ActiveRecord::Migration
  def up

    add_column :instagram_photos, :tour_id, :integer

    InstagramPhoto.all.each do |p|
      p.tour = Tour.find_or_create_by name: "Lines We Trace Midwest Madness Tour"
      p.save!
    end
  end

  def down
    remove_column :instagram_photos, :tour_id

  end
end
