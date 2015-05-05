class Admin::UsersController < Admin::BaseController
  before_action :require_admin
before_action :authenticate_user!
  def index
    @users = User.all.order('created_at DESC')
  end
def show
    @user = User.find(params[:id])
  end
 

  def new
    @user = User.new
  end
def edit
    @user = User.find(params[:id])
  end

def create
     @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path(@user)
      else
        render :new
    end
  end
   def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to admin_users_path(@user)
      
  end



  

 def destroy
    @user = User.find(params[:id])
    @user.destroy

    

    redirect_to admin_users_path

  end
 

def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :company, :client, :admin, track_ids: [])
  end


end
