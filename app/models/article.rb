class Article < ActiveRecord::Base
  has_many :article_artists, dependent: :destroy
  has_many :artists, through: :article_artists

  mount_uploader :image, ImageUploader
  crop_uploaded :image 

  attr_accessor :query

  enum status: { drafted: 0, published: 1 }

  def self.default_scope
    where(status: 1)
  end

  def self.to_publish(time = Time.now)
    unscoped.where('status = 0 AND scheduled_at < ?', time)
  end

  def homepreview2
    body[0..100].strip + '...'
  end

  def titlepreviewnews
    title[0..30] + '..'
  end

  def newspreview
    body[0..250].strip + '..'
  end

  def artistpreview
    body[0..100] + '..'
  end

  def embed(youtube)
    youtube_id = youtube.split('=').last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  def previous
    Article.limit(1).order('id DESC').where('id < ?', id).first
  end

  def next
    Article.limit(1).order('id ASC').where('id > ?', id).first
  end

  def slug
    title.downcase.tr(' ', '-')
  end

  def to_param
    "#{id}-#{slug}"
  end

  def tweetlink
    tweetlink = Article.request.original_url
  end

  class << self
    def search(query)
      query = (query && !query.empty?) ? "%#{query}%" : nil
      articles = Article.all
      articles = articles.where('title ILIKE ? or body ILIKE ?', query, query) if query
      articles
    end
  end
end
