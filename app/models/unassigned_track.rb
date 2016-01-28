class UnassignedTrack
  URL = 'https://s3-eu-west-1.amazonaws.com/bdi-music/'
  
  def self.all
    uploaded_tracks
  end

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def pretty_name
    name.gsub('tracks/', '')
  end

  def url
    self.class::URL + name
  end

  private

  class << self
  def uploaded_tracks
    @uploaded_tracks ||= fetch_uploaded_tracks
    @current_tracks ||= Track.pluck(:url).compact.map { |track| new(track.gsub(URL, '')) }
    current_track_names = @current_tracks.map(&:name)
    @uploaded_tracks.reject do |track|
      current_track_names.include?(track.name)
    end
  end

  def fetch_uploaded_tracks
    Rails.cache.fetch("uploaded_tracks", expires_in: 24.hours) do
      contents = s3.list_objects(bucket: 'bdi-music', prefix: 'tracks').contents
      contents.drop(1).map do |track|
        new(track.key)
      end
    end
  end

  def s3
    @s3 ||= Aws::S3::Client.new(region: 'eu-west-1')
  end
end
end