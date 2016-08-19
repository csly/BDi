class DropVimoe < ActiveRecord::Migration
   def change
    drop_table :vimeos
    drop_table :vimeo_artists
    drop_table :artist_vimeos
  end
end
