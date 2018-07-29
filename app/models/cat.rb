class Cat < ActiveRecord::Base

  def embed(youtube)
    youtube_id = link.split('=').first
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

end