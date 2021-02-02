class ShopItem < ActiveRecord::Base
  belongs_to :artist_shop
  mount_uploader :image, ItemUploader 

  delegate :artist, to: :artist_shop

  scope :ordered_by_artist, -> {
    joins(artist_shop: :artist)
    .order('artists.name asc, LOWER(shop_items.name) asc')
  }

  def preview
    description[0..100].strip + '...'
  end

  class << self
    def search(query)
      query = (query && !query.empty?) ? "%#{query}%" : nil
      return ShopItem.ordered_by_artist unless query
      ShopItem.ordered_by_artist.where('shop_items.name ILIKE ? or shop_items.description ILIKE ?', query, query)
    end
  end

end
