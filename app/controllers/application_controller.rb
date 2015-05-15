class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 

 
  def current_admin
    current_user && current_user.admin?
  end

  def require_admin
    unless current_admin 
    end
  end

  def current_client
    User.where(admin: false) 
  end

  def require_client
    unless current_admin 
    end
  end

   


  end
    


  