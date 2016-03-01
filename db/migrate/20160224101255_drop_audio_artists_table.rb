class DropAudioArtistsTable < ActiveRecord::Migration
 
  def down
    drop_table :audio_artists
  end

end
