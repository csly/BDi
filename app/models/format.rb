class Format < ActiveRecord::Base
  has_many :release_formats, dependent: :destroy
  has_many :releases, through: :release_formats
  has_many :artist_formats, dependent: :destroy
  has_many :artists, through: :artist_formats

  class << self
    def used
      format_ids = ReleaseFormat.distinct(:format_id).pluck(:format_id)
      Format.where(id: format_ids)
    end
  end
end
