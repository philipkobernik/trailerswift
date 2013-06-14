class AddTourIdToTourdate < ActiveRecord::Migration
  def change
    change_table :tour_dates do |t|
      t.references :tour
    end
  end
end
