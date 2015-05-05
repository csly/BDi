class AddYoutubeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :youtube, :text
  end
end
