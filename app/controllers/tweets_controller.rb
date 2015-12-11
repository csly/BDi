class TweetsController < ApplicationController
  def index
    username = 'bdimusic'
    options = {:count => 5, :include_rts => true}
    @tweets = $client.user_timeline(username, options)
  end
end