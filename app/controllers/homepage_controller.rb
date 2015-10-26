class HomepageController < ApplicationController

  def index
    @articles = Article.paginate(:page => params[:page], :per_page =>9).order('created_at DESC')
  end

  

end

