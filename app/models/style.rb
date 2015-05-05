class Style < ActiveRecord::Base

  has_many :track_styles, dependent: :destroy
  has_many :tracks, through: :track_styles
  
  


end
