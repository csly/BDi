class RenameReleaseMedia < ActiveRecord::Migration
  def self.up
    rename_table :release_media, :release_medias
  end

  def self.down
    rename_table :release_medias, :release_media
  end
end

