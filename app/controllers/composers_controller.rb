class ComposersController < ApplicationController

def index 
  @artists = Artist.all
 @composer_artists = @artists.where(composer: true).order('created_at DESC')
    
  end
 

  
  
end

