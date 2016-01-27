class Admin::ProductionsController < ApplicationController
  before_action :require_admin 
  
  def index
    @productions = Production.all
    @production = Production.new
  end

  def create
    @production = Production.new(production_params)
    if @production.save
      redirect_to admin_productions_path
    end
  end

   def new
    @production = Production.new
  end

  def destroy
    @production = Production.find(params[:id])
    if @production.destroy
      redirect_to admin_productions_path
    end
  end

  private

  def production_params
    params.require(:production).permit(:name)
  end

end