class AddInstagramPhoto < ActiveRecord::Migration
  def up
    create_table :instagram_photos do |t|
      t.string :tags, array: true
      t.float :lat
      t.float :lng
      t.string :created_time
      t.string :link
      t.string :img_url_thumb
      t.string :img_url_low
      t.string :img_url_standard
      t.string :caption
      t.string :users_in_photo, array: true
      t.string :instagram_user
      t.string :instagram_user_id
      t.string :instagram_id, uniq: true
      t.timestamps
    end

    add_index :instagram_photos, :instagram_id, unique: true
  end

  def down
    drop_table :instagram_photos
  end
end
