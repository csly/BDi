class VideoArtist < ActiveRecord::Base
  belongs_to :video
  belongs_to :artist
end
