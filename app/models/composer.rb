class Composer < ActiveRecord::Base
  has_many :composer_tracks
  has_many :tracks, through: :composer_tracks

  
end
