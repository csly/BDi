class AboutsController < ApplicationController

def index
  @abouts = About.all
   @staffs = Staff.all.order('staffs.created_at ASC')
end

 


 def about_params
    params.require(:about).permit(:body, :photo)
  end
end

 