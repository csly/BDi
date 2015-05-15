class AddTrackToPublisher < ActiveRecord::Migration
  def change
    add_column :tracks, :publisher_id, :integer
  end
end
