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
  end



 def artist_params
    params.require(:artist).permit(:name, :biog, :photo, :links, :twitter, :facebook, article_ids: [], award_ids: [], genre_ids: [], type_ids: [])
  end
end

