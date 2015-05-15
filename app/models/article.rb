class Article < ActiveRecord::Base
  has_many :article_artists, dependent: :destroy
  has_many :artists, through: :article_artists

    mount_uploader :image, ImageUploader
 attr_accessor :query 
   
   
   def preview
      body[0..120]  +  "  "
    end 

    def titlepreview
      title[0..11]  +  ".."
    end 
    def bodypreview
      body[0..22]  +  ".."
    end 
    def newspreview
    body[0..250]  +  ".."
    end 
    def homepreview
    body[0..54]  +  ".."
    end 
    def artistpreview
    body[0..100]  +  ".."
    end 
    def homepreview2
    body[0..129]  +  "..."
    end 

  def embed(youtube)
         youtube_id = youtube.split("=").last
         content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
   end
   
     class << self
      def search(query)
        where('title ILIKE ? or body ILIKE ?', query, query) if query
       
      end
    end
 


end



