class TrackStyle < ActiveRecord::Base
  belongs_to :track
  belongs_to :style 
  
end
