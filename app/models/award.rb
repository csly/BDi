class Award < ActiveRecord::Base
  has_many :award_artists, dependent: :destroy
  has_many :artists, through: :award_artists

  mount_uploader :image, AwardUploader
  crop_uploaded :image

  def titlepreviewnews
    title[0..30]  +  '..'
  end

  def preview
    body[0..200]  +  '  '
  end

  def titlepreview
    title[0..11]  +  '..'
  end

  def bodypreview
    body[0..22] + '..'
  end

  def newspreview
    body[0..300].strip + '..'
  end

  def artistpreview
    body[0..100] + '..'
  end

  def slug
    title.downcase.tr(' ', '-')
  end

  def to_param
    "#{id}-#{slug}"
  end

  def embed(youtube)
    youtube_id = youtube.split('=').last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  def previous
    Award.limit(1).order('id DESC').where('id < ?', id).first
  end

  def next
    Award.limit(1).order('id ASC').where('id > ?', id).first
  end

  class << self
    def search(query)
      query = (query && !query.empty?) ? "%#{query}%" : nil
      awards = Award.all
      awards = awards.where('title ILIKE ? or body ILIKE ?', query, query) if query
      awards
    end
  end
end
