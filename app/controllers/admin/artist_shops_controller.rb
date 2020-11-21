class Admin::ArtistShopsController < Admin::BaseController
  before_action :require_admin
  before_action :find_shop

  def index
    @artist_shops = ArtistShop.order('id ASC')
  end

  def show
    @artist_shop = ArtistShop.find(params[:id])
  end

  def edit
    @artist_shop = ArtistShop.find(params[:id])
  end

  def create
    @artist_shop = ArtistShop.new(artist_shop_params)
    if @artist_shop.save
      if params[:artist_shop][:photo].present?
        render :crop  
      else
        redirect_to admin_artist_shops_path(@artist_shop), notice: 'artist was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    @artist_shop = ArtistShop.find(params[:id])
    @artist_shop.update(artist_shop_params)
    if params[:artist_shop][:photo].present?
      render :crop  
    else
      redirect_to admin_artist_shops_path(@artist_shop)
    end
  end 

  def destroy
    @artist_shop = ArtistShop.find(params[:id])
    @artist_shop.destroy

    redirect_to admin_artist_shop_path
   end



  private


  def artist_shop_params
    params.require(:artist_shop).permit(:image, :description)
  end

  def find_shop
    @shop = ArtistShop.find_by_artist_id(params[:id])
  end
end