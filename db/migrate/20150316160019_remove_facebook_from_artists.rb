class RemoveFacebookFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :facebook, :string
  end
end
