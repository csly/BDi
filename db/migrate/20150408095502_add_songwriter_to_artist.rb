class AddSongwriterToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :songwriter, :boolean
  end
end
