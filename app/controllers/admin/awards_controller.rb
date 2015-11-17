class Admin::AwardsController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @awards = Award.all.order('created_at DESC')
  end
def show
    @award = Award.find(params[:id])
  end
 

  def new
    @award = Award.new
  end
def edit
    @award = Award.find(params[:id])
  end

def create
    @award = Award.new(award_params)
    if @award.save
      if params[:award][:image].present?
        render :crop  ## Render the view for cropping
      else
        redirect_to admin_awards_path(@award), notice: 'award was successfully created.'
      end
    else
      render :new
    end
  end  
  
  def update
    @award = Award.find(params[:id]) 
    @award.update(award_params)
    if params[:award][:image].present?
      render :crop  ## Render the view for cropping
    else
      redirect_to admin_awards_path(@award)
    end
  end

  

 def destroy
    @award = Award.find(params[:id])
    @award.destroy

    

    redirect_to admin_awards_path

  end
 

def award_params
    params.require(:award).permit(:title, :body, :image, :image_crop_x,
                                    :image_crop_y, :image_crop_w, :image_crop_h, artist_ids: [])
  end


end





