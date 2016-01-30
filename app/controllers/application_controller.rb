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

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_home_path
    else
      search_path
    end
  end

  $client.instance_eval do
    def user_timeline(username, options)
      begin
        @cached_tweets = super
        @cached_tweets
      rescue
        @cached_tweets || []
      end
    end
  end
  
end