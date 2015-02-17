class CreatePressArtists < ActiveRecord::Migration
  def change
    create_table :press_artists do |t|
      t.integer :artist_id
      t.integer :press_id

      t.timestamps null: false
    end
  end
end
