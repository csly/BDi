class AwardsController < ApplicationController

def index
  @awards = Award.all
end

def show
    @award = Award.find(params[:id])
  end



 def award_params
    params.require(:award).permit(:title, :body, :photo, artist_ids: [])
  end
end

 

