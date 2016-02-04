class ReleaseFormat < ActiveRecord::Base
  belongs_to :release
  belongs_to :format
end
