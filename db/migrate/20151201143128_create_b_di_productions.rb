class CreateBDiProductions < ActiveRecord::Migration
  def change
    create_table :b_di_productions do |t|
      t.string :name
      t.string :body
      t.string :links

      t.timestamps null: false
    end
  end
end
