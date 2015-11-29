class Audio < ActiveRecord::Base
  mount_uploader :track, TrackUploader
  belongs_to :artist
end
