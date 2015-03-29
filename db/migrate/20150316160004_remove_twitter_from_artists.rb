class RemoveTwitterFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :twitter, :string
  end
end
