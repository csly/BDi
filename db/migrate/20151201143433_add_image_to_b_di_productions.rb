class AddImageToBDiProductions < ActiveRecord::Migration
  def change
    add_column :b_di_productions, :image, :string
  end
end
