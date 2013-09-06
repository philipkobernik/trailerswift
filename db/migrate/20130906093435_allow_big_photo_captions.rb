class AllowBigPhotoCaptions < ActiveRecord::Migration
  def up
    change_column :instagram_photos, :caption, :text, :limit => nil
  end

  def down
    change_column :instagram_photos, :caption, :string
  end
end
