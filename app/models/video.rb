class Video < ActiveRecord::Base
  has_many :video_artists, dependent: :destroy
  has_many :artists, through: :video_artists

  mount_uploader :image, VideoUploader
  crop_uploaded :image

  def preview
    title[0..34]  +  ".."
  end 

  def embed(youtube)
   youtube_id = url.split("=").last
   content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  class << self
    def search(query, artist)
      query = (query && !query.empty?) ? "%#{query.downcase}%" : nil
      releases = Release.includes(:artists) 
      releases = releases.where(artists: {id: artist}) if artist.present?
      releases = releases.where('lower(title) ILIKE ? or lower(body) ILIKE ?', query) if query
      releases
    end
  end

end
