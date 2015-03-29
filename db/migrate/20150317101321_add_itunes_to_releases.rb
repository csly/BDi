class AddItunesToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :itunes, :string
  end
end
