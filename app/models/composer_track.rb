class ComposerTrack < ActiveRecord::Base
  belongs_to :composer
  belongs_to :track
end
