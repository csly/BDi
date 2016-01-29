class Artist < ActiveRecord::Base
  has_many :article_artists, dependent: :destroy
  has_many :articles, through: :article_artists
  has_many :award_artists, dependent: :destroy
  has_many :awards, through: :award_artists
  has_many :release_artists, dependent: :destroy
  has_many :releases, through: :release_artists
  has_many :artist_genres, dependent: :destroy
  has_many :genres, through: :artist_genres 
  has_many :artist_types, dependent: :destroy
  has_many :types, through: :artist_types 
  has_many :press_artists, dependent: :destroy
  has_many :presses, through: :press_artists
  has_many :artist_formats, dependent: :destroy
  has_many :formats, through: :artist_formats
  has_many :video_artists, dependent: :destroy
  has_many :videos, through: :video_artists
  has_many :audios

  mount_uploader :photo, ArtistUploader
  mount_uploader :biography, PDFUploader
  crop_uploaded :photo

  attr_accessor :query, :genre, :type

  def namepreview
    name[0..11]  +  ".."
  end 

  def biogpreview
     biog[0..22]  +  ".."
  end 

  def artistpreview
    biog[0..100]  +  ".."
  end 

  def adminpreview
    biog[0..50]  +  ".."
  end 

  def slug
    name.downcase.gsub(" ", "-")  
  end

  def to_param
    "#{id}-#{slug}"
  end
 
  def count
    @artists = Artist.find(params[:id])
  end

  class << self
    def used
      artist_ids = ReleaseArtist.distinct(:artist_id).pluck(:artist_id)
      Artist.where(id: artist_ids)
    end

    def search(query, genre, type)
        query = (query && !query.empty?) ? "%#{query.downcase}%" : nil
        artists = Artist.includes(:genres, :types)  
        artists = artists.where(genres: {id: genre}) if !genre.empty?
        artists = artists.where(types: {id: type}) if !type.empty?
        artists = artists.where('lower(name) LIKE ? or lower(biog) LIKE ?', query, query) if query
        artists  
    end
  end

  def composer_artist(artist)
    if artist.composer
     "".html_safe
    end
  end
  
  def genre_artist(artist)
    if artist.genre
     "".html_safe
    end
  end
 
end