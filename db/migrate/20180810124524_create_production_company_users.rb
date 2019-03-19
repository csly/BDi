class CreateProductionCompanyUsers < ActiveRecord::Migration
  def change
    create_table :production_company_users do |t|
      t.integer :user_id
      t.integer :production_company_id
    end
  end
end
