class Press < ActiveRecord::Base
   has_many :press_artists, dependent: :destroy
  has_many :artists, through: :press_artists

   mount_uploader :image, ImageUploader

   def preview
      body[0..200]  +  "  "
    end 

    def newspreview
      body[0..300] + " "
    end
     

     class << self
      def search(query)
        query = (query && !query.empty?) ? "%#{query}%" : nil 
        presses = Press.all
        presses = presses.where('title ILIKE ? or body ILIKE ?', query, query) if query
        presses
      end
    end
end
