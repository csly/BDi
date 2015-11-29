class AddScheduledToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :scheduled_at, :datetime, default: nil
  end
end
