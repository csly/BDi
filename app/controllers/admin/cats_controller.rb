class Admin::CatsController < Admin::BaseController
  before_action :require_admin

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      
    redirect_to admin_cats_path(@cat), notice: 'Video was successfully created.'  
    else
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)

    redirect_to admin_cats_path(@cat), notice: 'Video was successfully updated'
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy

    redirect_to admin_cats_path
  end

  def cat_params
    params.require(:cat).permit(:link)
  end
end
