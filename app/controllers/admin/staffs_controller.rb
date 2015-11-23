class Admin::StaffsController < Admin::BaseController
  before_action :require_admin 
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
      if params[:staff][:photo].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to admin_staffs_path(@staff), notice: 'staff was successfully created.'
      end
    else
      render :new
    end
  end  
  
  def update
    @staff = Staff.find(params[:id]) 
    @staff.update(staff_params)
    if params[:staff][:photo].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_staffs_path(@staff)
    end
  end


  

 def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy

    

    redirect_to admin_staffs_path

  end
 

def staff_params
    params.require(:staff).permit(:name, :biog, :photo,  :photo_crop_x,
                                    :photo_crop_y, :photo_crop_w, :photo_crop_h, :role, :email, :phone)
  end


end
