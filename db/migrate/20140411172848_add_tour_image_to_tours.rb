class AddTourImageToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_image, :string
  end
end
