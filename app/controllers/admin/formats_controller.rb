class Admin::FormatsController < ApplicationController
  before_action :require_admin

  def index
    @formats = Format.all
    @format = Format.new
  end

  def create
    @format = Format.new(format_params)
    redirect_to admin_formats_path if @format.save
  end

  def new
    @format = Format.new
  end

  def destroy
    @format = Format.find(params[:id])
    redirect_to admin_formats_path if @format.destroy
  end

  private

  def format_params
    params.require(:format).permit(:name)
  end
end
