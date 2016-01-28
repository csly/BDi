class BDiProduction < ActiveRecord::Base
   mount_uploader :image, ProductionUploader
   
end
