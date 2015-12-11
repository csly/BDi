class AddYoutubeToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :youtube, :string
  end
end
