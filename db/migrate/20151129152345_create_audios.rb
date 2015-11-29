class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :name
      t.string :track
      t.integer :artist_id
      t.timestamps null: false
    end
    add_index :audios, :artist_id
  end
end
