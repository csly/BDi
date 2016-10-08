class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.text :notification_params
      t.string :status
      t.references :shop_item
      t.string :buyers_name
      t.string :buyers_email

      t.string :address_name
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :address_country
      t.datetime :purchased_at
      t.float :total_amount

      t.timestamps null: false
    end
  end
end
