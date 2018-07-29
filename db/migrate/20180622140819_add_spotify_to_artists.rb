class AddSpotifyToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :spotify, :text
  end
end
