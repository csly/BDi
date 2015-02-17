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
        redirect_to admin_presses_path(@press)
      else
        render :new
    end
  end
   def update
    @press = Press.find(params[:id])
    @press.update(press_params)

    redirect_to admin_presses_path(@press)
      
  end



  

 def destroy
    @press = Press.find(params[:id])
    @press.destroy

    

    redirect_to admin_presses_path

  end
 

def press_params
    params.require(:press).permit(:title, :body, :photo, artist_ids: [])
  end


end
