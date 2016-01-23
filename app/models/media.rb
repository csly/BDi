class Media < ActiveRecord::Base
  has_many :release_medias, dependent: :destroy
  has_many :releases, through: :release_medias 

  class << self
    def used
      media_ids = ReleaseMedia.pluck(:media_id).uniq
      Media.find(media_ids)
    end
  end
 

end
 