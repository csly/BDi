class Admin::BDiProductionsController < Admin::BaseController
  before_action :require_admin
  def index
    @b_di_productions = BDiProduction.order('created_at DESC')
  end

  def show
    @b_di_production = BDiProduction.find(params[:id])
  end

  def new
    @b_di_production = BDiProduction.new
  end

  def edit
    @b_di_production = BDiProduction.find(params[:id])
  end

  def create
    @b_di_production = BDiProduction.new(b_di_production_params)
    if @b_di_production.save
      redirect_to admin_b_di_productions_path(@b_di_production), notice: 'production was successfully created.'
    end
  end

  def update
    @b_di_production = BDiProduction.find(params[:id])
    if @b_di_production.update(b_di_production_params)
      redirect_to admin_b_di_production_path(@b_di_production)
    end
  end

  def destroy
    @b_di_production = BDiProduction.find(params[:id])
    @b_di_production.destroy

    redirect_to admin_b_di_productions_path
   end

  def b_di_production_params
    params.require(:b_di_production).permit(:name, :body, :image, :links)
  end
end
