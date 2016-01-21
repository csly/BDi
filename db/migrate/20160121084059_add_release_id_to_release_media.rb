class AddReleaseIdToReleaseMedia < ActiveRecord::Migration
  def change
    add_column :release_media, :release_id, :integer
  end
end
