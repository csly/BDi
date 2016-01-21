class ArtistFormat < ActiveRecord::Base
  belongs_to :artist
  belongs_to :format
end
