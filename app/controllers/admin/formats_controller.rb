class Admin::FormatsController < ApplicationController
  before_action :require_admin 
  
  def index
    @formats= Format.all
    @format = Format.new
  end

  def create
    @format = Format.new(format_params)
    if @format.save
      redirect_to admin_formats_path
    end
  end

  def new
    @format = Format.new
  end

  def destroy
    @format = Format.find(params[:id])
    if @format.destroy
      redirect_to admin_formats_path
    end
  end

  private

  def format_params
    params.require(:format).permit(:name)
  end

end