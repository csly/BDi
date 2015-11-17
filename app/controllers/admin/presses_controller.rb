class Admin::PressesController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @presses = Press.all.order('created_at DESC')
  end
def show
    @press = Press.find(params[:id])
  end
 

  def new
    @press = Press.new
  end
def edit
    @press = Press.find(params[:id])
  end


def create
    @press = Press.new(press_params)
    if @press.save
      if params[:press][:image].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to admin_presses_path(@press), notice: 'press was successfully created.'
      end
    else
      render :new
    end
  end  
  
  def update
    @press = Press.find(params[:id]) 
    @press.update(press_params)
    if params[:press][:image].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_presses_path(@press)
    end
  end

  
 
 



  

 def destroy
    @press = Press.find(params[:id])
    @press.destroy

    

    redirect_to admin_presses_path

  end
 

def press_params
    params.require(:press).permit(:title, :body, :image, :image_crop_x,
                                    :image_crop_y, :image_crop_w, :image_crop_h, artist_ids: [])
  end


end




