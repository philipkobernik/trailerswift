class TourDate < ActiveRecord::Base
  belongs_to :tour

  validates :date, :uniqueness => {:scope => [ :tour_id, :venue ] }
  default_scope { order('date asc') }
  scope :upcoming, lambda { where("date > ?", (Time.zone.now - 1.day) ) }

  def to_coordinates
    return [self.lat, self.lng]
  end
end
