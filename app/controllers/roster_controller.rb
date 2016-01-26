class RosterController < ApplicationController

  def index
    @artists = Artist.all
    @artisttag_artists = @artists.where(artisttag: true).order('artists.name ASC')
  end
  
end

