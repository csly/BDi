class AddPhoneToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :phone, :string
  end
end
