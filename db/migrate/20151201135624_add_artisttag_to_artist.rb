class AddArtisttagToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :artisttag, :boolean
  end
end
