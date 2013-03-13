class CreateLocationTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lng
      t.float :lat
      t.datetime :located_at
      t.string :reverse
    end
  end
end
