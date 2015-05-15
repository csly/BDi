class CreateProductionCompanies < ActiveRecord::Migration
  def change
    create_table :production_companies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
