class AddInstagramPhoto < ActiveRecord::Migration
  def change
    create_table :instagram_photos do |t|
      t.string :tags
      t.string :location
      t.string :created_time
      t.string :link
      t.string :images
      t.string :caption
      t.string :user
      t.integer :instagram_id
    end
  end
end
