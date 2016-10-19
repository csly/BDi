class ArtistShop < ActiveRecord::Base
  belongs_to :artist
  has_many :items, class_name: 'ShopItem'
  
  def artist_name
    artist.name
  end 
end
