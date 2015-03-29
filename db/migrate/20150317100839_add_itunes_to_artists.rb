class AddItunesToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :itunes, :string
  end
end
