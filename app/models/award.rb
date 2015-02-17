class Award < ActiveRecord::Base
  has_many :award_artists, dependent: :destroy
  has_many :artists, through: :award_artists

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
    body[0..465]  +  ".."
    end 
end

