class AddBioToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :biography, :string
  end
end
