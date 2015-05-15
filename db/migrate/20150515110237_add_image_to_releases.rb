class AddImageToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :image, :string
  end
end
