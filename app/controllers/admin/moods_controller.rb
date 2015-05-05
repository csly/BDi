class Admin::MoodsController < ApplicationController
  before_action :require_admin 
  
  def index
    @moods = Mood.all
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    if @mood.save
      redirect_to admin_moods_path
    end
  end

  def new
    @mood = Mood.new
  end

  def destroy
    @mood = Mood.find(params[:id])
    if @mood.destroy
      redirect_to admin_moods_path
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:name)
  end


end