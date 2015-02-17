class CreateArticleArtists < ActiveRecord::Migration
  def change
    create_table :article_artists do |t|
      t.integer :artist_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
