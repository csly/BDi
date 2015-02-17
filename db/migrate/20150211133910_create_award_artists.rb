class CreateAwardArtists < ActiveRecord::Migration
  def change
    create_table :award_artists do |t|
      t.integer :artist_id
      t.integer :award_id

      t.timestamps null: false
    end
  end
end
