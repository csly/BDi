class Genre < ActiveRecord::Base
  has_many :release_genres, dependent: :destroy
  has_many :releases, through: :release_genres
  has_many :artist_genres, dependent: :destroy
  has_many :artists, through: :artist_genres

  class << self
    def used
      genre_ids = ReleaseGenre.distinct(:genre_id).pluck(:genre_id)
      Genre.where(id: genre_ids)
    end
  end
end
