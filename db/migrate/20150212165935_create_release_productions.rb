class CreateReleaseProductions < ActiveRecord::Migration
  def change
    create_table :release_productions do |t|
      t.integer :production_id
      t.integer :release_id

      t.timestamps null: false
    end
  end
end
