class AddAttachmentPhotoToAbouts < ActiveRecord::Migration
  def self.up
    change_table :abouts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :abouts, :photo
  end
end
