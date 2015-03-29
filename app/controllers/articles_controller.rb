class ArticlesController < ApplicationController

def index
  @articles = Article.paginate(page: params[:page], per_page: 10).order('articles.created_at DESC')
end

def show
    @article = Article.find(params[:id]) 
    
  end



 def article_params
    params.require(:article).permit(:title, :body, :image, artist_ids: [])
  end
end

