class RemovePhotoFromArtists < ActiveRecord::Migration
  def self.up
    remove_attachment :staffs, :photo
    add_column :artists, :image, :string
  end
end
