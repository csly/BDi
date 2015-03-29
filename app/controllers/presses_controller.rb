class PressesController < ApplicationController

def index
  @presses = Press.all.paginate(page: params[:page], per_page: 15).order('presses.created_at DESC')
end

def show
    @press = Press.find(params[:id])
  end



 def press_params
    params.require(:press).permit(:title, :body, :photo, artist_ids: [])
  end
end

 

