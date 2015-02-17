class ReleaseGenre < ActiveRecord::Base
  belongs_to :release
  belongs_to :genre
end
