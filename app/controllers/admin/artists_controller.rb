class Admin::ArtistsController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @artists = Artist.all.order('created_at DESC')
  end
def show
    @artist = Artist.find(params[:id])
  end
 

  def new
    @artist = Artist.new
  end
def edit
    @artist = Artist.find(params[:id])
  end

def create
     @artist = Artist.new(artist_params)
      if @artist.save
        redirect_to admin_artists_path(@artist)
      else
        render :new
    end
  end
   def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)

    redirect_to admin_artists_path(@artist)
      
  end



  

 def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    

    redirect_to admin_artist_path

  end
 

def artist_params
    params.require(:artist).permit(:name, :biog, :photo, article_ids: [], award_ids: [], genre_ids: [], type_ids: [])
  end


end
