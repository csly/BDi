class Admin::VideosController < Admin::BaseController
  before_action :require_admin 

  def index
    @videos = Video.unscoped.all.paginate(page: params[:page], per_page: 20).order('videos.created_at DESC')
  end

  def show
    @video = Video.find(params[:id])
  end
 
  def new
    @video = Video.new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      if params[:video][:image].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to admin_videos_path(@video), notice: 'video was successfully created.'
      end
    else
      render :new
    end
  end  
  
  def update
    @video = Video.find(params[:id]) 
    @video.update(video_params)
    if params[:video][:image].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_videos_path(@video)
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to admin_videos_path
  end

  def video_params
    params.require(:video).permit(:title, :url,  :created_at, :image, :image_crop_x,
                                    :image_crop_y, :image_crop_w, :image_crop_h, artist_ids: [])
  end

end





