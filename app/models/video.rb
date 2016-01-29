class Video < ActiveRecord::Base
  has_many :video_artists, dependent: :destroy
  has_many :artists, through: :video_artists

  mount_uploader :image, ReleaseUploader
  crop_uploaded :image

  def embed(youtube)
   youtube_id = url.split("=").last
   content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

end
