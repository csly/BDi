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

  # has_attached_file :photo
  mount_uploader :image, ImageUploader
  # validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
 
  attr_accessor :query, :genre, :type

 def namepreview
      name[0..11]  +  ".."
    end 
  def biogpreview
      biog[0..22]  +  ".."
    end 

  def count
    @artists = Artist.find(params[:id])
  end

  class << self
    def used
      artist_ids = ReleaseArtist.pluck(:artist_id).uniq
      Artist.find(artist_ids)
    end
  end

  class << self
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
 
end