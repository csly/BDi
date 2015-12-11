module ArticleHelper
  include ActionView::Helpers::UrlHelper

def embed(youtube)
      youtube_id = youtube.split("=").last
      content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
end

end