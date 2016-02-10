class RemoveColumns < ActiveRecord::Migration
  def self.up
    remove_column :articles, :featured_image
    remove_column :articles, :featured
  end
end
