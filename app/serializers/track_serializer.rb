class TrackSerializer < ActiveModel::Serializer
  embed :objects

  attributes :title, :oldtitle, :catalogue

  has_many :productions
end
