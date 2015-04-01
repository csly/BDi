class Article < ActiveRecord::Base
  has_many :article_artists, dependent: :destroy
  has_many :artists, through: :article_artists

  has_attached_file :image, :default_url => "/images/:style/missing.png"
 
   
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
 
end



