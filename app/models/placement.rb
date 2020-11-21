class Placement < ActiveRecord::Base
  has_many :artist_placements, dependent: :destroy
  has_many :artists, through: :artist_placements

  mount_uploader :image, PlacementUploader 
  crop_uploaded :image

  def preview
    title[0..30] + '..'
  end

  def embed(_youtube)
    youtube_id = url.split('=').last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  def vimeoid
    vimeo = url.split('.com/').last
  end
 
end


