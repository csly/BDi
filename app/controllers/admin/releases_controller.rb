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
      if params[:release][:image].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to admin_releases_path(@release), notice: 'release was successfully created.'
      end
    else
      render :new
    end
  end  
  
  def update
    @release = Release.find(params[:id]) 
    @release.update(release_params)
    if params[:release][:image].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_releases_path(@release)
    end
  end


  

 def destroy
    @release = Release.find(params[:id])
    @release.destroy

    

    redirect_to admin_releases_path

  end
 

def release_params
    params.require(:release).permit(:title, :body, :image, :image_crop_x,
                                    :image_crop_y, :image_crop_w, :image_crop_h, :date, :links,:amazon, :chart_position, :itunes, artist_ids: [], genre_ids: [], production_ids: [])
  end


end





