class RemoveItunesFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :itunes, :string
  end
end
