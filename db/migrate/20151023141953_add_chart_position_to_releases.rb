class AddChartPositionToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :chart_position, :integer
  end
end
