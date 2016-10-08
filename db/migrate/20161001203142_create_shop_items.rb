class CreateShopItems < ActiveRecord::Migration
  def change
    create_table :shop_items do |t|
      t.references :artist_shop, index: true
      t.string :name, null: false
      t.text :description
      t.float :price

      t.timestamps null: false
    end
  end
end
