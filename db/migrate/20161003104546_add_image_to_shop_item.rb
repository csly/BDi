class AddImageToShopItem < ActiveRecord::Migration
  def change
    add_column :shop_items, :image, :string
  end
end
