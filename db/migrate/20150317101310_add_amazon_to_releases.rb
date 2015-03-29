class AddAmazonToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :amazon, :string
  end
end
