class CreateReleaseMedia < ActiveRecord::Migration
  def change
    create_table :release_media do |t|
      t.integer :media_id
      t.integer :release_id

      t.timestamps null: false
    end

  end
end
