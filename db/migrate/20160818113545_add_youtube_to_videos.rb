class AddYoutubeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :youtube, :boolean
    add_column :videos, :vimeo, :boolean
  end
end
