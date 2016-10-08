class Admin::ItemsController < Admin::BaseController
before_action :require_admin 

  def index
   @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      if params[:items][:image].present?
        render :crop ## Render the view for cropping
      else
        redirect_to admin_items_path(@item), notice: 'Item was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if params[:item][:image].present?
      render :crop ## Render the view for cropping
    else
      redirect_to admin_items_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to admin_items_path
  end

  def item_params
    params.require(:item).permit(:title, :link, :image, :description, :price)
  end
end