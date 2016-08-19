class Admin::ProductsController < Admin::BaseController
  before_action :require_admin

  def index 
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:product][:image].present?
        render :crop ## Render the view for cropping
      else
        redirect_to admin_products_path(@product), notice: 'Product was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if params[:product][:image].present?
      render :crop ## Render the view for cropping
    else
      redirect_to admin_products_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_products_path
  end

  def product_params
    params.require(:product).permit(:title, :price, :image, :description, :link, :image_crop_x,
                                  :image_crop_y, :image_crop_w, :image_crop_h, artist_ids: [])
  end
end
