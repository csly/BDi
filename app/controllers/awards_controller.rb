class AwardsController < ApplicationController

def index
  @awards = Award.all.paginate(page: params[:page], per_page: 15).order('awards.created_at DESC')
end

def show
    @award = Award.find(params[:id])
    @articles = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
    @presses = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
  end



 def award_params
    params.require(:award).permit(:title, :body, :photo, artist_ids: [])
  end
end

 

