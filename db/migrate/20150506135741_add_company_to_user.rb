class AddCompanyToUser < ActiveRecord::Migration
  def change
    remove_column :users, :company
    add_column :users, :production_company_id, :integer
    add_index :users, :production_company_id
  end
end
