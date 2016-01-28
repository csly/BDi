class ReleaseArtist < ActiveRecord::Base
  belongs_to :release
  belongs_to :artist
  
end
