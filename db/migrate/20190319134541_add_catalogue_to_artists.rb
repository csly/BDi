class AddCatalogueToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :catalogue, :boolean
  end
end
