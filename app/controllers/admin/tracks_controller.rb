class Admin::TracksController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @tracks = Track.all.order('created_at DESC')
  end
def show
    @track = Track.find(params[:id])
  end
 

  def new
    @track = Track.new
  end
def edit
     
    @track = Track.find(params[:id])
  end

def create
     @track = Track.new(track_params)
      if @track.save
        redirect_to admin_tracks_path(@track)
      else
        render :new
    end
  end
   def update
    @track = Track.find(params[:id])
    @track.update(track_params)

    redirect_to admin_tracks_path(@track)
      
  end



  

 def destroy
    @track = Track.find(params[:id])
    @track.destroy

    

    redirect_to admin_track_path

  end
 

def track_params
    params.require(:track).permit(:title, :catalogue, :oldtitle, :origin, :track_composer, user_ids: [], style_ids: [], instrumentation_ids: [], mood_ids: [], production_ids: [])
  end


end
