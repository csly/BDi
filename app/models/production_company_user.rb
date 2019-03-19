class ProductionCompanyUser < ActiveRecord::Base
  belongs_to :production_company
  belongs_to :user
end
