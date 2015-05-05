class AddComposerToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :composer, :boolean
  end
end
