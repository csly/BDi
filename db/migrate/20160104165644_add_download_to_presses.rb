class AddDownloadToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :download, :string
  end
end
