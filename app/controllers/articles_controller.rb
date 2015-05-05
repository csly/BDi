class ArticlesController < ApplicationController

def index
    
  @articles = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
end


def show
    @article = Article.find(params[:id]) 
    @articles = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
    @presses = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
  end



 def article_params
    params.require(:article).permit(:title, :body, :youtube, :image, artist_ids: [])
  end


end

