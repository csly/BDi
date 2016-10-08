class Admin::ShopItemsController < Admin::BaseController
before_action :require_admin 

  def index
   @shop_items = ShopItem.order('created_at DESC')
  end

  def show
    @shop_item = ShopItem.find(params[:id])
  end

  def new
    @shop_item = ShopItem.new
  end

  def edit
    @shop_item = ShopItem.find(params[:id])
  end

  def create
    @shop_item = ShopItem.new(shop_item_params)
    if @shop_item.save
      redirect_to admin_shop_items_path(@shop_item)
    else
      render :new
  end
  end

  def update
    @shop_item = ShopItem.find(params[:id])
    @shop_item.update(shop_item_params)

    redirect_to admin_shop_items_path(@shop_item)
  end
 

  def destroy
    @shop_item = ShopItem.find(params[:id])
    @shop_item.destroy

    redirect_to admin_shop_items_path
  end

  def shop_item_params
    params.require(:shop_item).permit(:name, :link, :image, :description, :price, :image_crop_x,
                                  :image_crop_y, :image_crop_w, :image_crop_h,  :artist_shop, :artist_shop_id, artist_shop_ids: [], artist_ids: [])
  end
end