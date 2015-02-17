class AddTitleToNewsArticle < ActiveRecord::Migration
  def change
    add_column :news_articles, :title, :string
  end
end
