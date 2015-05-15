class ProductionCompany < ActiveRecord::Base
  has_many :users
  has_many :productions
end
