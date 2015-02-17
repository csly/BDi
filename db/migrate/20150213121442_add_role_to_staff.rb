class AddRoleToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :role, :string
  end
end
