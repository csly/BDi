class Staff < ActiveRecord::Base
      mount_uploader :photo, AboutUploader
      crop_uploaded :photo
end
