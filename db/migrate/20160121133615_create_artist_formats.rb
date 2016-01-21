class CreateArtistFormats < ActiveRecord::Migration
  def change
    create_table :artist_formats do |t|
      t.integer :artist_id
      t.integer :format_id

      t.timestamps null: false
    end
  end
end
