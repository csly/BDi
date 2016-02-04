class AdminController < ApplicationController
  def current_admin
    current_user && current_user.admin?
  end

  def require_admin
    redirect_to root_path unless current_admin
  end
end
