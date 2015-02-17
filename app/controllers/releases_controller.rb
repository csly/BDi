class ReleasesController < ApplicationController

def index
@releases = Release.all
  if params[:q]
      @releases = Release.search(params[:q], params[:genre], params[:artist], params[:production]) 
    else
      params[:limit] ||= 10
      @releases = Release.all
 
    end
  end

def show
    @release = Release.find(params[:id])
  end



 def release_params
   params.require(:release).permit(:title, :body, :photo, :date, :links, artist_ids: [], genre_ids: [], production_ids: [])
end


 
end
