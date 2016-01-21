class AddMediaToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :media, :string
  end
end
