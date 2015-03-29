class AddAmazonToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :amazon, :string
  end
end
