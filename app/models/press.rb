class Press < ActiveRecord::Base
   has_many :press_artists, dependent: :destroy
  has_many :artists, through: :press_artists

   mount_uploader :image, ImageUploader

   def preview
      body[0..200]  +  "  "
    end 

    def newspreview
      body[0..465] + " "
    end
     
end
