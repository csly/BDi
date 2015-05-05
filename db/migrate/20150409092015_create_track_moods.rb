class CreateTrackMoods < ActiveRecord::Migration
  def change
    create_table :track_moods do |t|
      t.integer :track_id
      t.integer :mood_id

      t.timestamps null: false
    end
  end
end
