class AddCompanyToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :production_company_id, :integer
    add_index :productions, :production_company_id
  end
end
