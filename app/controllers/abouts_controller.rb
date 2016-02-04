class AboutsController < ApplicationController
  def index
    @abouts = About.all
    @staffs = Staff.all.order('staffs.created_at ASC')
    username = 'bdimusic'
    options = { count: 20, include_rts: true }
    @tweets = $client.user_timeline(username, options)
  end

  def about_params
    params.require(:about).permit(:body, :photo)
  end
end
