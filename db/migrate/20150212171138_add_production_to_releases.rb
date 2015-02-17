class AddProductionToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :production, :string
  end
end
