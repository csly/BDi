class CreateArtistVideos < ActiveRecord::Migration
  def change
    create_table :artist_videos do |t|
      t.integer :artist_id
      t.integer :video_id

      t.timestamps null: false
    end
  end
end
