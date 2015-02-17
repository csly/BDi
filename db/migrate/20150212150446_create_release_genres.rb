class CreateReleaseGenres < ActiveRecord::Migration
  def change
    create_table :release_genres do |t|
      t.integer :genre_id
      t.integer :release_id

      t.timestamps null: false
    end
  end
end
