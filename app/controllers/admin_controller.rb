class AdminController < ApplicationController

  def current_admin
    current_user && current_user.admin?
  end

  def require_admin
    unless current_admin
      redirect_to root_path
    end
  end
  
end