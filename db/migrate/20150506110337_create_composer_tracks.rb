class CreateComposerTracks < ActiveRecord::Migration
  def change
    create_table :composer_tracks do |t|
      t.integer :track_id
      t.integer :composer_id

      t.timestamps null: false
    end
  end
end
