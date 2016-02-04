class Admin::BaseController < AdminController
  before_action :require_admin

  def after_update_path_for(resource)
    DeviseUsageLog.log(resource, DeviseAction::Edit)
    root_url
  end

  private
end
