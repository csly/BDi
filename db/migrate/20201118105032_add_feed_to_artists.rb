class AddFeedToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :feed, :string
  end
end
