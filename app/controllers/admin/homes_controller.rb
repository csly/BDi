class Admin::HomesController < Admin::BaseController
  before_action :require_admin 
  
  def show
        @articles = Article.paginate(page: params[:page], per_page: 3).order('articles.created_at DESC')
        @abouts = About.paginate(page: params[:page], per_page: 3).order('abouts.created_at DESC')
        @artists = Artist.paginate(page: params[:page], per_page: 3).order('artists.created_at DESC')
        @releases = Release.paginate(page: params[:page], per_page: 3).order('releases.created_at DESC')
        @awards = Award.paginate(page: params[:page], per_page: 3).order('awards.created_at DESC')
        @presses = Press.paginate(page: params[:page], per_page: 3).order('presses.created_at DESC') 
  end 
  
end