class AboutsController < ApplicationController

def index
  @abouts = About.all
   @staffs = Staff.all
end

 


 def about_params
    params.require(:about).permit(:body, :photo)
  end
end

