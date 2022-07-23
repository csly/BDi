class AddInstagramToArtsits < ActiveRecord::Migration
  def change
    add_column :artists, :instagram, :string
    add_column :artists, :tiktok, :string
    add_column :artists, :website, :string
    add_column :artists, :youtube, :string
  end
end
