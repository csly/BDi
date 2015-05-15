class Mood < ActiveRecord::Base
  has_many :track_moods, dependent: :destroy
  has_many :tracks, through: :track_moods

  scope :for_tracks, -> (tracks) {
    find(TrackMood.where(track_id: tracks.pluck(:id)).distinct(:mood_id).pluck(:mood_id))
  }
end
