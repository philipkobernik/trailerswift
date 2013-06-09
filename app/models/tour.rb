class Tour < ActiveRecord::Base
  has_many :tour_dates

  def import_tour_dates(file_name)
    raise "must be persisted" unless persisted?
    GigpressTourDateParser.new(file_name, id).each do |tour_date_args|
      TourDate.create! tour_date_args
    end

  end
end