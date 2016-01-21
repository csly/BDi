class AddPartistToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :partist, :string
  end
end
