class AddImageToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :image, :string
  end
end
