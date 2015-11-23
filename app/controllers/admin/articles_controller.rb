class Admin::ArticlesController < Admin::BaseController
  before_action :require_admin 

  def index
    @articles = Article.paginate(page: params[:page], per_page: 20).order('articles.created_at DESC')
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
      if params[:article][:image].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to admin_articles_path(@article), notice: 'Article was successfully created.'
      end
    else
      render :new
    end
  end  
  
  def update
    @article = Article.find(params[:id]) 
    @article.update(article_params)
    if params[:article][:image].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_articles_path(@article)
    end
  end



  

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    

    redirect_to admin_articles_path

  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :youtube, :image, :image_crop_x,
                                    :image_crop_y, :image_crop_w, :image_crop_h,
                                    artist_ids: [])
  end
end
