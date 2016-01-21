class CreateReleaseFormats < ActiveRecord::Migration
  def change
    create_table :release_formats do |t|
      t.integer :release_id
      t.integer :format_id

      t.timestamps null: false
    end
  end
end
