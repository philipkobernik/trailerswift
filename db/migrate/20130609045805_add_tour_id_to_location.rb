class AddTourIdToLocation < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.references :tour
    end
  end
end
