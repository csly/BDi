class ChangeColumns < ActiveRecord::Migration
  def change
    change_column :abouts, :body, :text
    change_column :artists, :biog, :text
    change_column :awards, :body, :text
    change_column :releases, :body, :text
  end
end
