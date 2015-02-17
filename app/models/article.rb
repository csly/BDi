class Article < ActiveRecord::Base
  has_many :article_artists, dependent: :destroy
  has_many :artists, through: :article_artists

  has_attached_file :image, :default_url => "/images/:style/missing.png", :styles => { :small => "160x160!"} 
 
   
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
    body[0..465]  +  ".."
    end 
end

