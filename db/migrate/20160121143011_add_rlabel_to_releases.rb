class AddRlabelToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :rlabel, :string
  end
end
