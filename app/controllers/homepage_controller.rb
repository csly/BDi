class HomepageController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 9).order('created_at DESC')
    username = 'bdimusic'
    options = { count: 20, include_rts: true }
    @tweets = $client.user_timeline(username, options)
  end
end
