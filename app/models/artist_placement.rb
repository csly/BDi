class ArtistPlacement < ActiveRecord::Base
  belongs_to :artist
  belongs_to :placement
end
