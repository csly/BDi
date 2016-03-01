class FixColName < ActiveRecord::Migration
  def self.up
    rename_column :audios, :order, :arrange
  end
end
