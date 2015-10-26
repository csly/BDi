module ApplicationHelper
    def embed(youtube)
         youtube_id = youtube.split("=").last
         content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
   end

   def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
 
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
  nil
  end
def title(page_title)
  content_for(:title) { page_title }
end



 
def page_title  
  @page_title
end

def ptit
  @ptit = page_title2
  @ptit = @ptit
  @ptit.capitalize!
  @ptit
end
def page_title
  @page_title = @page_title
end
end
