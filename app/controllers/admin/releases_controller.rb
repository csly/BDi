class Admin::ReleasesController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @releases = Release.all.order('created_at DESC')
  end
def show
    @release = Release.find(params[:id])
  end
 

  def new
    @release = Release.new
  end
def edit
    @release = Release.find(params[:id])
  end

def create
     @release = Release.new(release_params)
      if @release.save
        redirect_to admin_releases_path(@release)
      else
        render :new
    end
  end
   def update
    @release = Release.find(params[:id])
    @release.update(release_params)

    redirect_to admin_releases_path(@release)
      
  end



  

 def destroy
    @release = Release.find(params[:id])
    @release.destroy

    

    redirect_to admin_releases_path

  end
 

def release_params
    params.require(:release).permit(:title, :body, :photo, :date, :links,:amazon, :itunes, artist_ids: [], genre_ids: [], production_ids: [])
  end


end
