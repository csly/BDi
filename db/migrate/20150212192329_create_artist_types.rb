class CreateArtistTypes < ActiveRecord::Migration
  def change
    create_table :artist_types do |t|
      t.integer :artist_id
      t.integer :type_id

      t.timestamps null: false
    end
  end
end
