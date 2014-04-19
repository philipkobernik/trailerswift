class AddActiveFlagToTours < ActiveRecord::Migration
  def change
    add_column :tours, :active, :boolean, default: false
  end
end
