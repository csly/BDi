class ArticlesController < ApplicationController
  def index
    if params[:q]
      @articles = Article.search(params[:q]).paginate(page: params[:page], per_page: 10).order('articles.created_at DESC')
      @recentnews = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
      @recentpress = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
      @recentawards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
      username = 'bdimusic'
      options = { count: 30, include_rts: true }
      @tweets = $client.user_timeline(username, options)
      if @articles.blank?
        redirect_to articles_path(@article), notice: 'There are no News Articles that match your search requirements. Please try again'
      end
    else
      params[:limit] ||= 10
      @articles = Article.paginate(page: params[:page], per_page: params[:limit]).order('articles.created_at DESC')
      @recentnews = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
      @recentpress = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
      @recentawards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
      username = 'bdimusic'
      options = { count: 30, include_rts: true }
      @tweets = $client.user_timeline(username, options)
    end
  end

  def show
    @article = Article.unscoped.find(params[:id])
    @articles = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
    @presses = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
  end

  def to_param
    title.blank? ? id : title
  end

  def article_params
    params.require(:article).permit(:title, :body, :youtube, :image, :created_at, artist_ids: [])
  end

  def pagetitle
    pagetitle = 'News'
  end
end
