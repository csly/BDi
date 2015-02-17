class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
