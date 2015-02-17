class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 helper_method :current_admin, :current_client
  before_filter :redirect_admin_location
  
 
  def redirect_admin_location
    session[:user_return_to] = admin_path
      unless User.where(admin: false)
        session[:client_return_to] = clients_path
      end
  end
 

 
  def current_admin
    current_user && current_user.admin?
  end

  def require_admin
    unless current_admin
      redirect_to clients_path
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
    


  