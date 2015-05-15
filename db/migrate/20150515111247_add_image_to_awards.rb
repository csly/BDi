class AddImageToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :image, :string
  end
end
