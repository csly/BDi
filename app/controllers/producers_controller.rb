class ProducersController < ApplicationController

  def index 
    @artists = Artist.all
    @producer_artists = @artists.where(producer: true).order('artists.name ASC')
      
  end
   
end

