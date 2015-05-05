class AddTrackIdToUserTracks < ActiveRecord::Migration
  def change
    add_column :user_tracks, :track_id, :integer
  end
end
