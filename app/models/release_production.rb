class ReleaseProduction < ActiveRecord::Base
  belongs_to :release
  belongs_to :production
  
end
