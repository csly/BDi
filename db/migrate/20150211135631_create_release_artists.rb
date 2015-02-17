class CreateReleaseArtists < ActiveRecord::Migration
  def change
    create_table :release_artists do |t|
      t.integer :artist_id
      t.integer :release_id

      t.timestamps null: false
    end
  end
end
