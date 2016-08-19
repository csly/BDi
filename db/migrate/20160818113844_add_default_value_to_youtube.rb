class AddDefaultValueToYoutube < ActiveRecord::Migration
  def up
    change_column :videos, :youtube, :boolean, :default => true
  end
   def down
    change_column :videos, :youtube, :boolean, :default => false
  end
end
