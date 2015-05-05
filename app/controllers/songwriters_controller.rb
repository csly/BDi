class SongwritersController < ApplicationController

def index 
  @artists = Artist.all
 @songwriter_artists = @artists.where(songwriter: true).order('created_at DESC')
    
  end
 

  
  
end

