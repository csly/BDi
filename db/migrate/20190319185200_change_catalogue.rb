class ChangeCatalogue < ActiveRecord::Migration
  def change
    change_column :artists, :catalogue, :boolean, default: false, null: false
  end
end
