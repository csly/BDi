class AwardsController < ApplicationController
  def index
    if params[:q]
      @awards = Award.search(params[:q]).paginate(page: params[:page], per_page: 10).order('awards.created_at DESC')
      @recentnews = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
      @recentpress = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
      @recentawards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
      username = 'bdimusic'
      options = { count: 30, include_rts: true }
      @tweets = $client.user_timeline(username, options)
      if @awards.blank?
        redirect_to awards_path(@award), notice: 'There are no Awards that match your search requirements. Please try again'
      end
    else
      params[:limit] ||= 10
      @awards = Award.paginate(page: params[:page], per_page: params[:limit]).order('awards.created_at DESC')
      @recentnews = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
      @recentpress = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
      @recentawards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
      username = 'bdimusic'
      options = { count: 30, include_rts: true }
      @tweets = $client.user_timeline(username, options)
    end
  end

  def show
    @award = Award.find(params[:id])
    @awards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
    @articles = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
    @presses = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
    end

  def award_params
    params.require(:award).permit(:title, :body, :image, :youtube, :created_at, artist_ids: [])
  end
end
