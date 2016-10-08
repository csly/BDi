class CreateArtistShops < ActiveRecord::Migration
  def up
    create_table :artist_shops do |t|
      t.references :artist, index: { unique: true }
      t.timestamps null: false
    end

    Artist.find_each do |artist|
      ArtistShop.create!(artist: artist)
    end
  end

  def down
    drop_table :artist_shops
  end
end
