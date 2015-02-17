class AddEmailToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :email, :string
  end
end
