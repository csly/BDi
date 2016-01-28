class Press < ActiveRecord::Base
  has_many :press_artists, dependent: :destroy
  has_many :artists, through: :press_artists

  mount_uploader :image, PressUploader
  mount_uploader :download, PdfpressUploader
  crop_uploaded :image

  def titlepreviewnews
    title[0..30]  +  ".."
  end 

  def preview
    body[0..200]  +  "  "
  end 

  def newspreview
    body[0..300].strip + " "
  end

  def artistpreview
    body[0..100]  +  ".."
  end 
   
  def slug
    title.downcase.gsub(" ", "-")  
  end

  def to_param
    "#{id}-#{slug}"
  end
  
  def previous
    Press.limit(1).order("id DESC").where("id < ?", id).first
  end

  def next
    Press.limit(1).order("id ASC").where("id > ?", id).first
  end

  class << self
    def search(query)
      query = (query && !query.empty?) ? "%#{query}%" : nil 
      presses = Press.all
      presses = presses.where('title ILIKE ? or body ILIKE ?', query, query) if query
      presses
    end
  end

end
