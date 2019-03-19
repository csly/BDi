class ProductionCompany < ActiveRecord::Base
  has_many :users
  has_many :productions
  has_many :production_company_users, dependent: :destroy
  has_many :users, through: :production_company_users
end
