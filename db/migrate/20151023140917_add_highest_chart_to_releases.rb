class AddHighestChartToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :highest_chart, :string
  end
end
