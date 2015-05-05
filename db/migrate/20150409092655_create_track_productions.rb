class CreateTrackProductions < ActiveRecord::Migration
  def change
    create_table :track_productions do |t|
      t.integer :track_id
      t.integer :production_id

      t.timestamps null: false
    end
  end
end
