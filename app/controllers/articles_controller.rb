class ArticlesController < ApplicationController

def index
  @articles = Article.all
end

def show
    @article = Article.find(params[:id])
  end



 def article_params
    params.require(:article).permit(:title, :body, :image, artist_ids: [])
  end
end

