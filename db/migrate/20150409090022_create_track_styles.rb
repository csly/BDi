class CreateTrackStyles < ActiveRecord::Migration
  def change
    create_table :track_styles do |t|
      t.integer :track_id
      t.integer :style_id

      t.timestamps null: false
    end
  end
end
