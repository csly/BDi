class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.string :title
      t.string :url
      t.string :image

      t.timestamps null: false
    end
    create_table :artist_placements do |t|
      t.integer :artist_id
      t.integer :placement_id

      t.timestamps null: false
    end
  end
end 