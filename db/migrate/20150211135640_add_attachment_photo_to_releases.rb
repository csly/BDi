class AddAttachmentPhotoToReleases < ActiveRecord::Migration
  def self.up
    change_table :releases do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :releases, :photo
  end
end
