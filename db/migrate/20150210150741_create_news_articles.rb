class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|

      t.timestamps null: false
    end
  end
end
