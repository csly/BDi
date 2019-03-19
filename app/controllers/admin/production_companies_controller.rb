class Admin::ProductionCompaniesController < ApplicationController
  before_action :require_admin

  def index
    @production_companies = ProductionCompany.all
    @production_company = ProductionCompany.new
  end

  def create
    @production_company = ProductionCompany.new(production_company_params)
    redirect_to admin_production_companies_path if @production_company.save
  end

  def new
    @production_company = ProductionCompany.new
 end

 def edit
    @production_company = ProductionCompany.unscoped.find(params[:id])
  end

   
  def update
    @production_company = ProductionCompany.find(params[:id])
    @production_company.update(production_company_params)
    
    redirect_to admin_production_companies_path(@production_company)
  end

  def destroy
    @production_company = ProductionCompany.find(params[:id])
    redirect_to admin_production_companies_path if @production_company.destroy
  end

  private

  def production_company_params
    params.require(:production_company).permit(:name, user_ids: [], production_ids: [])
  end
end
