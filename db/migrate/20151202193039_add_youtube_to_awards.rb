class AddYoutubeToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :youtube, :string
  end
end
