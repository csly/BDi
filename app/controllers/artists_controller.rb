require 'open-uri'
class ArtistsController < ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).order('artists.name ASC')
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
      type: 'application/pdf'
    )
  end

  def artist_params
    params.require(:artist).permit(:name, :biog, :photo, :links, :composer, :songwriter, :artisttag, :producer, :twitter, :catalogue, :facebook, article_ids: [], award_ids: [], genre_ids: [], type_ids: [], release_ids: [], video_ids: [], vimeo_ids: [], product_ids: [])
  end
end
