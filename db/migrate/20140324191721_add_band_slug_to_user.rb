class AddBandSlugToUser < ActiveRecord::Migration
  def change
    add_column :users, :band_slug, :string
  end
end
