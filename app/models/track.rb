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
  has_many :production_companies, through: :productions

  belongs_to :publisher
  has_many :composer_tracks
  has_many :composers, through: :composer_tracks

  scope :for_company, -> (company) {
    if company
      includes(:production_companies).where('production_companies.id = ?', company.id).references(:production_companies)
    else
      all
    end
  }


  class << self
    def search(params, company: nil)
      tracks = Track.for_company(company).where('title ILIKE ?', "%#{params[:track_title]}%") if params[:track_title]
      %w(production mood instrumentation).each do |model|
        table = "#{model}s"
        reference = table.to_sym
        data = params["#{model}_ids".to_sym]
        if data
          tracks = tracks.includes(reference).where("#{table}.id IN (?)", data).references(reference)
        end
      end
      tracks
    end

    def for_user(user)
      return all if user.admin?
      production_company = user.production_company
      productions = production_company.productions.pluck(:id)
      track_ids = TrackProduction.where(production_id: productions).pluck(:track_id)
      Track.find(track_ids)
    end
  end

end
