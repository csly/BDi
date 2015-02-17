class PressesController < ApplicationController

def index
  @presses = Press.all
end

def show
    @press = Press.find(params[:id])
  end



 def press_params
    params.require(:press).permit(:title, :body, :photo, artist_ids: [])
  end
end

 

