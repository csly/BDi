class VideosController < ApplicationController

   def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).paginate(page: params[:page], per_page: 24).order('videos.created_at DESC')
  end

  def show
    @video = Video.find(params[:id])
  end

  
end


 
