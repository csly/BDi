class CreateArtistReleases < ActiveRecord::Migration
  def change
    create_table :artist_releases do |t|
      t.timestamps null: false
    end
  end
end
