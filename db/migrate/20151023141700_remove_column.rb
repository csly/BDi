class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :releases, :highest_chart
  end
end
