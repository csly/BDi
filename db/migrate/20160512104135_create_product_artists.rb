class CreateProductArtists < ActiveRecord::Migration
  def change
    create_table :product_artists do |t|
      t.integer :artist_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
