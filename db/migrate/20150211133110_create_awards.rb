class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
