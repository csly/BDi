class CreateTrackInstrumentations < ActiveRecord::Migration
  def change
    create_table :track_instrumentations do |t|
      t.integer :track_id
      t.integer :instrumentation_id

      t.timestamps null: false
    end
  end
end
