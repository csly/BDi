class Instrumentation < ActiveRecord::Base
  has_many :track_instrumentations, dependent: :destroy
  has_many :tracks, through: :track_instrumentations

  scope :for_tracks, -> (tracks) {
    find(TrackInstrumentation.where(track_id: tracks.pluck(:id)).distinct(:instrumentation_id).pluck(:instrumentation_id))
  }
  
end
