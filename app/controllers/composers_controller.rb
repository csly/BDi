class ComposersController < ApplicationController

def index 
  @artists = Artist.all
 @composer_artists = @artists.where(composer: true).order('artists.name ASC')
    
  end
 

  
  
end

