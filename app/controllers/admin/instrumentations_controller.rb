class Admin::InstrumentationsController < ApplicationController
  before_action :require_admin

  def index
    @instrumentations = Instrumentation.all
    @instrumentation = Instrumentation.new
  end

  def create
    @instrumentation = Instrumentation.new(instrumentation_params)
    redirect_to admin_instrumentations_path if @instrumentation.save
  end

  def new
    @instrumentation = Instrumentation.new
  end

  def destroy
    @instrumentation = Instrumentation.find(params[:id])
    redirect_to admin_instrumentations_path if @instrumentation.destroy
  end

  private

  def instrumentation_params
    params.require(:instrumentation).permit(:name)
  end
end
