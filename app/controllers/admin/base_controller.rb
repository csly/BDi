class Admin::BaseController < ApplicationController
before_action :require_admin
before_action :authenticate_user!
def after_update_path_for(resource)
  DeviseUsageLog.log(resource, DeviseAction::Edit)
  root_url
end
  private
end