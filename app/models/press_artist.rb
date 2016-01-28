class PressArtist < ActiveRecord::Base
  belongs_to :press
  belongs_to :artist
  
end
