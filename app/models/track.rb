class Track < ActiveRecord::Base

  has_many :user_tracks, dependent: :destroy
  has_many :users, through: :user_tracks

  has_many :track_styles, dependent: :destroy
  has_many :styles, through: :track_styles
  has_many :track_instrumentations, dependent: :destroy
  has_many :instrumentations, through: :track_instrumentations
  has_many :track_moods, dependent: :destroy
  has_many :moods, through: :track_moods
  has_many :track_productions, dependent: :destroy
  has_many :productions, through: :track_productions

attr_accessor :users


   
end
