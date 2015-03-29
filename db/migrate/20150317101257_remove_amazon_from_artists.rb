class RemoveAmazonFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :amazon, :string
  end
end
