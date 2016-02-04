class Roster < ActiveRecord::Base
  class << self
    def search(query, genre, type)
      query = (query && !query.empty?) ? "%#{query.downcase}%" : nil
      roster = Artist.includes(:genres, :types)
      roster = artists.where(genres: { id: genre }) unless genre.empty?
      roster = artists.where(types: { id: type }) unless type.empty?
      roster = artists.where('lower(name) LIKE ? or lower(biog) LIKE ?', query, query) if query
      roster
    end
  end
end
