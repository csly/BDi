class AddPformatToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :pformat, :string
  end
end
