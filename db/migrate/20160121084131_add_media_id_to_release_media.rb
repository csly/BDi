class AddMediaIdToReleaseMedia < ActiveRecord::Migration
  def change
    add_column :release_media, :media_id, :integer
  end
end
