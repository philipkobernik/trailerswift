class AddTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.timestamps
    end
  end
end
