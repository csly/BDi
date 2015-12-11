class AddFeaturedTextToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :featured_text, :string
  end
end
