class Admin::ArticlesController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @articles = Article.all.order('created_at DESC')
  end
def show
    @article = Article.find(params[:id])
  end
 

  def new
    @article = Article.new
  end
def edit
    @article = Article.find(params[:id])
  end

def create
     @article = Article.new(article_params)
      if @article.save
        redirect_to admin_articles_path(@article)
      else
        render :new
    end
  end

 

  
   def update
    @article = Article.find(params[:id]) 
    @article.update(article_params)

    redirect_to admin_articles_path(@article)
       

  end



  

 def destroy
    @article = Article.find(params[:id])
    @article.destroy

    

    redirect_to admin_articles_path

  end


def article_params
    params.require(:article).permit(:title, :body, :youtube, :image, artist_ids: [])
  end


end
