require 'open-uri'
class ArtistsController < ApplicationController

  def index
@artists = Artist.all
  if params[:q]
      @artists = Artist.search(params[:q], params[:genre], params[:type]).paginate(page: params[:page], per_page: 100).order('artists.name ASC')
    else
      params[:limit] ||= 10
      @artists = Artist.all.paginate(page: params[:page], per_page: 100).order('artists.name ASC')
 
    end
  end

  def show
    @artist = Artist.find(params[:id])  
    @related_artists = Artist.where.not(id: @artist.id).order('RANDOM()').limit(3)
  end

  def download
    @artist = Artist.find(params[:id])
    data = open(@artist.biography.file.url).read
    send_data(
      data,
        disposition: 'attachment',
        filename: "#{@artist.name}_biography.pdf",
        type: "application/pdf"
      )
  end

  def artist_params
    params.require(:artist).permit(:name, :biog, :photo, :links, :composer, :songwriter, :artisttag, :producer, :twitter, :facebook, article_ids: [], award_ids: [], genre_ids: [], type_ids: [], release_ids: [])
  end
  
end

