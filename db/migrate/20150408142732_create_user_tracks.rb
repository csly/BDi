class CreateUserTracks < ActiveRecord::Migration
  def change
    create_table :user_tracks do |t|

      t.timestamps null: false
    end
  end
end
