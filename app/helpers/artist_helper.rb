module ArtistHelper
  include ActionView::Helpers::UrlHelper

  def artist_list_for(artists)
    list = []
    artists.each do |artist|
      list << link_to(artist.name, artist_path(artist))
    end
    safe_join(list, ', ')
  end
    
end