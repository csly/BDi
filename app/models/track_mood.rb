class TrackMood < ActiveRecord::Base
  belongs_to :track 
  belongs_to :mood 
end
