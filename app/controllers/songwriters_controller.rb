class SongwritersController < ApplicationController

def index 
  @artists = Artist.all
 @songwriter_artists = @artists.where(songwriter: true).order('artists.name ASC')
    
  end
 

  
  
end

