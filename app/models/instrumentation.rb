class Instrumentation < ActiveRecord::Base
  has_many :track_instrumentations, dependent: :destroy
  has_many :tracks, through: :track_instrumentations
end
