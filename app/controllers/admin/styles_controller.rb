class Admin::StylesController < ApplicationController
  before_action :require_admin

  def index
    @styles = Style.all
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    redirect_to admin_styles_path if @style.save
  end

  def new
    @style = Style.new
  end

  def destroy
    @style = Style.find(params[:id])
    redirect_to admin_styles_path if @style.destroy
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end
end
