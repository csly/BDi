class Admin::PlacementsController < Admin::BaseController
  before_action :require_admin

  def index
    @placements = Placement.all.paginate(page: params[:page], per_page: 20).order('created_at DESC')
  end

  def show
    @placement = Placement.find(params[:id])
  end

  def new
    @placement = Placement.new
  end

  def edit
    @placement = Placement.find(params[:id])
  end

  def create
    @placement = Placement.new(placement_params)
    if @placement.save
      redirect_to admin_placements_path(@placement)
    else
      render :new
    end
  end

  def update
    @placement = Placement.find(params[:id])
    @placement.update(placement_params)

    redirect_to admin_placements_path(@placement)
  end

  def destroy
    @placement = Placement.find(params[:id])
    @placement.destroy

    redirect_to admin_placements_path
  end

  def placement_params
    params.require(:placement).permit(:title, :url, :created_at, :image, :image_crop_x,
                                  :image_crop_y, :image_crop_w, :image_crop_h, artist_ids: [])
  end
end


