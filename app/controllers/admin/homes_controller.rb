class Admin::HomesController < Admin::BaseController
    before_action :require_admin
before_action :authenticate_user! 
  def show
        @articles = Article.all
  end 
  
end