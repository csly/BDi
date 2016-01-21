class Format < ActiveRecord::Base
  has_many :release_formats, dependent: :destroy
  has_many :releases, through: :release_formats

  class << self
    def used
      format_ids = ReleaseFormat.pluck(:format_id).uniq
      Format.find(format_ids)
    end
  end

end
