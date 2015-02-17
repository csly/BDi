class Press < ActiveRecord::Base
   has_many :press_artists, dependent: :destroy
  has_many :artists, through: :press_artists

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

   def preview
      body[0..200]  +  "  "
    end 

    def newspreview
      body[0..465] + " "
    end
     
end
