class AddToArtistShops < ActiveRecord::Migration
  def change
    add_column :artist_shops, :image, :string
    add_column :artist_shops, :description, :text
  end
end
