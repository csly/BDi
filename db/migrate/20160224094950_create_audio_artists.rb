class CreateAudioArtists < ActiveRecord::Migration
  def change
    create_table :audio_artists do |t|
      t.integer :artist_id
      t.integer :audio_id

      t.timestamps null: false
    end
  end
end
