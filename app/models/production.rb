class Production < ActiveRecord::Base
  has_many :release_productions, dependent: :destroy
  has_many :releases, through: :release_productions

  class << self
    def used
      production_ids = ReleaseProduction.pluck(:production_id).uniq
      Production.find(production_ids)
    end
  end
end


