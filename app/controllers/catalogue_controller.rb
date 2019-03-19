class CatalogueController < ApplicationController
  def index
    @artists = Artist.all
    @catalogue_artists = @artists.where(catalogue: true).order('artists.name ASC')
  end
end