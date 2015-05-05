class AddUserIdToUserTracks < ActiveRecord::Migration
  def change
    add_column :user_tracks, :user_id, :integer
  end
end
