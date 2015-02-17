class Type < ActiveRecord::Base

   class << self
    def used
      type_ids = ArtistType.pluck(:type_id).uniq
      Type.find(type_ids)
    end
  end

end
