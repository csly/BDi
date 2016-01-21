class Format < ActiveRecord::Base
  has_many :release_formats, dependent: :destroy
  has_many :releases, through: :release_formats
  has_many :artist_formats, dependent: :destroy
  has_many :artists, through: :artist_formats

  class << self
    def used
      format_ids = ReleaseFormat.pluck(:format_id).uniq
      Format.find(format_ids)
    end
  end

end
