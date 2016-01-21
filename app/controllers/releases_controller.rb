class ReleasesController < ApplicationController

def index
  if params[:q]
      @releases = Release.search(params[:q], params[:genre], params[:artist], params[:format]).paginate(page: params[:page], per_page: 15).order('releases.date DESC') 
      if @releases.blank?
              redirect_to releases_path(@release), notice: "There are no Releases that match your search requirements. Please try again"
      end
    else
      params[:limit] ||= 10
      @releases = Release.paginate(page: params[:page], per_page: 15).order('releases.date DESC')
  
    end
  end

def show
    @release = Release.find(params[:id])
  end



 def release_params
   params.require(:release).permit(:title, :body, :featured_text, :image, :date, :amazon, :itunes, :links, :chart_position, :pformat, :partist, :rlabel, artist_ids: [], genre_ids: [], format_ids: [], production_ids: [])
end


 
end
