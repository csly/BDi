class CreateVideoArtists < ActiveRecord::Migration
  def change
    create_table :video_artists do |t|
      t.integer :artist_id
      t.integer :video_id

      t.timestamps null: false
    end
  end
end
