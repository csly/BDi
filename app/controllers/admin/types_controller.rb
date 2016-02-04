class Admin::TypesController < ApplicationController
  before_action :require_admin

  def index
    @types = Type.all
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    redirect_to admin_types_path if @type.save
  end

  def new
    @type = Type.new
  end

  def destroy
    @type = Type.find(params[:id])
    redirect_to admin_types_path if @type.destroy
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end
end
