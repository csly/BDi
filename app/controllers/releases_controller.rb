class ReleasesController < ApplicationController

def index
  if params[:q]
      @releases = Release.search(params[:q], params[:genre], params[:artist], params[:production]).paginate(page: params[:page], per_page: 15).order('releases.date DESC') 
    else
      params[:limit] ||= 10
      @releases = Release.paginate(page: params[:page], per_page: 15).order('releases.date DESC')
 
    end
  end

def show
    @release = Release.find(params[:id])
  end



 def release_params
   params.require(:release).permit(:title, :body, :image, :date, :amazon, :itunes, :links, :chart_position, artist_ids: [], genre_ids: [], production_ids: [])
end


 
end
