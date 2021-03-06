require 'open-uri'
class PressesController < ApplicationController
  def index
    if params[:q]
      @presses = Press.search(params[:q]).paginate(page: params[:page], per_page: 10).order('presses.created_at DESC')
      @recentnews = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
      @recentpress = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
      @recentawards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
      username = 'bdimusic'
      options = { count: 30, include_rts: true }
      @tweets = $client.user_timeline(username, options)
      if @presses.blank?
        redirect_to presses_path(@press), notice: 'There are no Stories that match your search requirements. Please try again'
      end
    else
      params[:limit] ||= 10
      @presses = Press.paginate(page: params[:page], per_page: params[:limit]).order('presses.created_at DESC')
      @recentnews = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
      @recentpress = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
      @recentawards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
      username = 'bdimusic'
      options = { count: 30, include_rts: true }
      @tweets = $client.user_timeline(username, options)
    end
  end

  def show
    @press = Press.find(params[:id])
    @articles = Article.paginate(page: params[:page], per_page: 5).order('articles.created_at DESC')
    @presses = Press.paginate(page: params[:page], per_page: 5).order('presses.created_at DESC')
    @awards = Award.paginate(page: params[:page], per_page: 5).order('awards.created_at DESC')
  end

  def pdfdown
    @press = Press.find(params[:id])
    data = open(@press.download.file.url).read
    send_data(
      data,
      disposition: 'attachment',
      filename: "#{@press.title}.pdf",
      type: 'application/pdf'
    )
  end

  def press_params
    params.require(:press).permit(:title, :body, :image, :link, :created_at, :youtube, artist_ids: [])
  end
end



