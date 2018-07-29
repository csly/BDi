class HomepageController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 9).order('created_at DESC')
    @cats = Cat.limit(1).order('created_at DESC')
    username = 'bdimusic'
    options = { count: 20, include_rts: true }
    @tweets = $client.user_timeline(username, options)
    @cats = Cat.limit(1).order('created_at DESC')
  end
end
