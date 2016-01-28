class ArticleArtist < ActiveRecord::Base
  belongs_to :article
  belongs_to :artist
  
end
