class Release < ActiveRecord::Base
  has_many :release_artists, dependent: :destroy
  has_many :artists, through: :release_artists
  has_many :release_genres, dependent: :destroy
  has_many :genres, through: :release_genres
  has_many :release_productions, dependent: :destroy
  has_many :productions, through: :release_productions

  attr_accessor :query, :genre, :artist, :production

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

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
   class << self
      def search(query, genre, artist, production)
        query = (query && !query.empty?) ? "%#{query}%" : nil
        releases = Release.includes(:genres, :artists, :productions)  
        releases = releases.where(genres: {id: genre}) if !genre.empty?
        releases = releases.where(artists: {id: artist}) if !artist.empty?        
        releases = releases.where(productions: {id: production}) if !production.empty?    
        releases = releases.where('title LIKE ? or body LIKE ?', query, query) if query
        releases
      end
    end
end
