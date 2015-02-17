class AddAttachmentPhotoToPresses < ActiveRecord::Migration
  def self.up
    change_table :presses do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :presses, :photo
  end
end
