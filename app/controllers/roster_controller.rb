class RosterController < ApplicationController

def index
@artists = Artist.all
  if params[:q]
      @artists = Artist.search(params[:q], params[:genre], params[:type]).paginate(page: params[:page], per_page: 100).order('artists.name ASC')
    else
      params[:limit] ||= 10
      @artists = Artist.all.paginate(page: params[:page], per_page: 100).order('artists.name ASC')
 
    end
  end
 
 
end

