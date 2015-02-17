class ArtistType < ActiveRecord::Base
  belongs_to :artist
  belongs_to :type
end
