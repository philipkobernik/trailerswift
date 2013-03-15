class AddTourDateTable < ActiveRecord::Migration
  def change
    create_table :tour_dates do |t|
      t.date :date
      t.string :city_state
      t.string :venue
      t.string :map_query
      t.string :ticket_url
      t.string :facebook_url
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
