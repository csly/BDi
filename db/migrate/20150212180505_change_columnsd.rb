class ChangeColumnsd < ActiveRecord::Migration
  def change
    change_column :presses, :body, :text
  end
end
