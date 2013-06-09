class Tour < ActiveRecord::Base
  has_many :tour_dates, :dependent => :destroy
  has_many :locations, :dependent => :destroy

  def import_tour_dates(file_name)
    raise "must be persisted" unless persisted?
    Gigpress::TourDateParser.new(file_name, id).each do |tour_date_args|
      TourDate.create! tour_date_args
    end

  end
end