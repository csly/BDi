class TrackInstrumentation < ActiveRecord::Base
  belongs_to :track 
  belongs_to :instrumentation 
  
end
