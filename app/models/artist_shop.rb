class ArtistShop < ActiveRecord::Base
  belongs_to :artist
  has_many :items, class_name: 'ShopItem'
end
