class AwardArtist < ActiveRecord::Base
  belongs_to :award
  belongs_to :artist
end
