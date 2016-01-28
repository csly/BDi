class Release < ActiveRecord::Base
  has_many :release_artists, dependent: :destroy
  has_many :artists, through: :release_artists
  has_many :release_genres, dependent: :destroy
  has_many :genres, through: :release_genres
  has_many :release_productions, dependent: :destroy
  has_many :productions, through: :release_productions
  has_many :release_formats, dependent: :destroy
  has_many :formats, through: :release_formats

  mount_uploader :image, ReleaseUploader
  crop_uploaded :image

  attr_accessor :query, :genre, :artist

  def preview
    body[0..200]  +  "  "
  end 

  def titlepreview
    title[0..11]  +  ".."
  end 

  def bodypreview
    body[0..22]  +  ".."
  end 

  def newspreview
    body[0..465] + ".."
  end

  def artistpreview
    body[0..100] + ".."
  end

  def relbody
    body[0..140] + ".."
  end

  def artpreview
    title[0..11]  +  ".."
  end 

  def slug
    title.to_s.downcase.gsub(" ", "-")
  end

  def to_param
    "#{id}-#{slug}"
  end
   
  class << self
    def search(query, genre, artist, format)
      query = (query && !query.empty?) ? "%#{query.downcase}%" : nil
      releases = Release.includes(:genres, :artists, :formats) 
      releases = releases.where(genres: {id: genre}) if genre.present?
      releases = releases.where(artists: {id: artist}) if artist.present?
      releases = releases.where(formats: {id: format}) if format.present?
      releases = releases.where('lower(title) ILIKE ? or lower(body) ILIKE ?', query, query) if query
      releases
    end
  end
 
end
