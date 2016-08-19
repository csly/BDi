class ProductArtist < ActiveRecord::Base
  belongs_to :product
  belongs_to :artist
end
