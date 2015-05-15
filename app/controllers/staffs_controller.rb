class StaffsController < ApplicationController

def index
  @staffs = Staff.all
end

def show
    @staff = Staff.find(params[:id])
  end



 def staff_params
    params.require(:staff).permit(:name, :biog, :image, :role, :email, :phone)
  end
end

 

