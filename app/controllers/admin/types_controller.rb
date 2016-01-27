class Admin::TypesController < ApplicationController
  before_action :require_admin 
  
  def index
    @types = Type.all
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to admin_types_path
    end
  end

  def new
    @type = Type.new
  end

  def destroy
    @type = Type.find(params[:id])
    if @type.destroy
      redirect_to admin_types_path
    end
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end

end