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

  class << self
    def search(params)
      tracks = Track.where('title ILIKE ?', "%#{params[:track_title]}%") if params[:track_title]
      %w(production mood instrumentation style).each do |model|
        table = "#{model}s"
        reference = table.to_sym
        data = params["#{model}_ids".to_sym]
        if data
          tracks = tracks.includes(reference).where("#{table}.id IN (?)", data).references(reference)
        end
      end
      tracks
    end
  end

end
