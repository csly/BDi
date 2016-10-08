class ShopItem < ActiveRecord::Base
  belongs_to :artist_shop
  mount_uploader :image, ItemUploader 

  delegate :artist, to: :artist_shop

  def preview
    description[0..100].strip + '...'
  end
end
