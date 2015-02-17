class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.string :body
      t.date :date
      t.string :links

      t.timestamps null: false
    end
  end
end
