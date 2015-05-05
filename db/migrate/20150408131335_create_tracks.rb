class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :catalogue
      t.string :oldtitle
      t.string :origin
      t.string :track_composer

      t.timestamps null: false
    end
  end
end
