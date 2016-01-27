class Admin::StylesController < ApplicationController
  before_action :require_admin 
  
  def index
    @styles = Style.all
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to admin_styles_path
    end
  end

  def new
    @style = Style.new
  end

  def destroy
    @style = Style.find(params[:id])
    if @style.destroy
      redirect_to admin_styles_path
    end
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end

end