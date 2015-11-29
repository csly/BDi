class Release < ActiveRecord::Base
  has_many :release_artists, dependent: :destroy
  has_many :artists, through: :release_artists
  has_many :release_genres, dependent: :destroy
  has_many :genres, through: :release_genres
  has_many :release_productions, dependent: :destroy
  has_many :productions, through: :release_productions

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
    def artpreview
    title[0..18]  +  ".."
    end 

     
    
   class << self
      def search(query, genre, artist, production)
        query = (query && !query.empty?) ? "%#{query.downcase}%" : nil
        releases = Release.includes(:genres, :artists, :productions)  
        releases = releases.where(genres: {id: genre}) if !genre.empty?
        releases = releases.where(artists: {id: artist}) if !artist.empty?        
        releases = releases.where(productions: {id: production}) if !production.empty?    
        releases = releases.where('lower(title) LIKE ? or lower(body) LIKE ?', query, query) if query
        releases
      end
    end
end
