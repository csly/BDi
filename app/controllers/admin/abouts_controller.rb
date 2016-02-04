class Admin::AboutsController < Admin::BaseController
  before_action :require_admin

  def index
    @abouts = About.all
    @staffs = Staff.all
  end

  def show
    @about = About.find(params[:id])
  end

  def new
    @about = About.new
  end

  def edit
    @about = About.find(params[:id])
  end

  def create
    @about = About.new(about_params)
    if @about.save
      redirect_to admin_about_path(@about)
    else
      render :new
  end
  end

  def update
    @about = About.find(params[:id])
    @about.update(about_params)

    redirect_to admin_abouts_path(@about)
  end

  def about_params
    params.require(:about).permit(:body, :photo)
  end
end
