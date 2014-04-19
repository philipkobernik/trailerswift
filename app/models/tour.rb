class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :tour_dates, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  has_many :instagram_photos, :dependent => :destroy

  before_validation :ensure_uniqueness_of_active_state

  mount_uploader :tour_image, TourImageUploader

  def ensure_uniqueness_of_active_state
    if active?
      self.user.tours.where.not(id: self.id).update_all active: false
    end
  end

  def import_gigpress_dates(file)
    raise "must be persisted" unless persisted?

    success_count = 0
    error_count = 0
    errors = []

    Gigpress::TourDateParser.read(file).each_with_index do |tour_date_args, index|
      begin
        TourDate.create! tour_date_args.merge(tour_id: self.id)
        success_count += 1
      rescue StandardError => e
        error_count += 1
        errors << "Tour Date ##{index+1}: #{e.message}"
      end
    end

    return {
      success_count: success_count,
      error_count: error_count,
      error_messages: errors
    }
  end
end
