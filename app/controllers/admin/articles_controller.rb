class Admin::ArticlesController < Admin::BaseController
  before_action :require_admin 
  before_action :publish?, only: [:create, :update]

  def index
    @articles = Article.unscoped.all.paginate(page: params[:page], per_page: 20).order('articles.created_at DESC')
  end

  def show
    @article = Article.unscoped.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.unscoped.find(params[:id])
  end

  def draft
    @article = Article.unscoped.find(params[:id])
    @article.update_attributes({status: :draft, scheduled_at: nil})
    redirect_to admin_articles_path(@article)
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
    @article = Article.unscoped.find(params[:id]) 
    if (article_params[:scheduled_at].present?)
      params[:article][:scheduled_at] = DateTime.strptime(article_params[:scheduled_at], "%m/%d/%Y %l:%M %p")
    end
    
    @article.update(article_params)
    if params[:article][:image].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_articles_path(@article)
    end
  end



  

  def destroy
    @article = Article.unscoped.find(params[:id])
    @article.destroy
    

    redirect_to admin_articles_path

  end

  private

  def publish?
    if (article_params[:status])
      params[:article][:status] = :published
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :scheduled_at, :created_at, :status, :youtube, :image, :image_crop_x,
                                    :image_crop_y, :image_crop_w, :image_crop_h,
                                    artist_ids: [],)
  end
end
