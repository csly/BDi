class Mood < ActiveRecord::Base
  has_many :track_moods, dependent: :destroy
  has_many :tracks, through: :track_moods
end
