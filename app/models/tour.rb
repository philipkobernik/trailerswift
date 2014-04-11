class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :tour_dates, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  has_many :instagram_photos, :dependent => :destroy

  mount_uploader :tour_image, TourImageUploader

  def import_tour_dates(file_name)
    raise "must be persisted" unless persisted?
    Gigpress::TourDateParser.read(file_name).each do |tour_date_args|
      TourDate.create! tour_date_args.merge(tour_id: self.id)
    end

  end
end
