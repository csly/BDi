class Admin::ProductionsController < ApplicationController
  before_action :require_admin

  def index
    @productions = Production.all
    @production = Production.new
  end

  def create
    @production = Production.new(production_params)
    redirect_to admin_productions_path if @production.save
  end

  def new
    @production = Production.new
 end

  def destroy
    @production = Production.find(params[:id])
    redirect_to admin_productions_path if @production.destroy
  end

  private

  def production_params
    params.require(:production).permit(:name)
  end
end
