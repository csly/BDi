class AddOrderToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :order, :integer
  end
end
