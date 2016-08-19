class Product < ActiveRecord::Base
  has_many :product_artists, dependent: :destroy
  has_many :artists, through: :product_artists

  mount_uploader :image, ProductUploader 
  crop_uploaded :image

end
