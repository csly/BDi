class DropAudioArtistsTable < ActiveRecord::Migration
  def change
  end
   def down
    drop_table :audio_artists
  end
end
