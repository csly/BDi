class TrackProduction < ActiveRecord::Base
  belongs_to :track 
  belongs_to :production 
end
