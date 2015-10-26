class Award < ActiveRecord::Base
  has_many :award_artists, dependent: :destroy
  has_many :artists, through: :award_artists

  mount_uploader :image, ImageUploader

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
    body[0..300]  +  ".."
    end 

    class << self
      def search(query)
        query = (query && !query.empty?) ? "%#{query}%" : nil 
        awards = Award.all
        awards = awards.where('title ILIKE ? or body ILIKE ?', query, query) if query
        awards
      end
    end

end

