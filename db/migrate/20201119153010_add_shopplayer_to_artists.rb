class AddShopplayerToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :shopplayer, :string
  end
end
