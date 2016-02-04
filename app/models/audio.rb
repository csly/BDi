class Audio < ActiveRecord::Base
  mount_uploader :track, TrackUploader
  belongs_to :artist

  def artist
    if read_attribute(:artist_id)
      super
    else
      NullArtist.new
    end
  end
end
