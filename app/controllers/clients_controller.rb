class ClientsController < ApplicationController
before_action :require_client
  before_action :authenticate_user!
  def index
    @tracks = Track.all
    @styles = Style.all
    @moods = Mood.all 
    @instrumentations = Instrumentation.all
    @users = User.all
  end

  def show

  end

end