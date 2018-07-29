class CreateCat < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.text :link

      t.timestamps null: false
    end
  end
end
