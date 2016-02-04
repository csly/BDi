class ReleaseMedia < ActiveRecord::Base
  belongs_to :release
  belongs_to :media
end
