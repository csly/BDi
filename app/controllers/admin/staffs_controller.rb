class Admin::StaffsController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @staffs = Staff.all
  end
def show
    @staff = Staff.find(params[:id])
  end
 

  def new
    @staff = Staff.new
  end
def edit
    @staff = Staff.find(params[:id])
  end

def create
     @staff = Staff.new(staff_params)
      if @staff.save
        redirect_to admin_abouts_path(@about)
      else
        render :new
    end
  end
   def update
    @staff = Staff.find(params[:id])
    @staff.update(staff_params)

    redirect_to admin_abouts_path(@about)
      
  end



  

 def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy

    

    redirect_to admin_staffs_path

  end
 

def staff_params
    params.require(:staff).permit(:name, :biog, :photo, :role, :email, :phone)
  end


end
