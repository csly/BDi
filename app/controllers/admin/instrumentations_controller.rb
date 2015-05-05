class Admin::InstrumentationsController < ApplicationController
  before_action :require_admin 
  
  def index
    @instrumentations = Instrumentation.all
    @instrumentation = Instrumentation.new
  end

  def create
    @instrumentation = Instrumentation.new(instrumentation_params)
    if @instrumentation.save
      redirect_to admin_instrumentations_path
    end
  end

  def new
    @instrumentation = Instrumentation.new
  end

  def destroy
    @instrumentation = Instrumentation.find(params[:id])
    if @instrumentation.destroy
      redirect_to admin_instrumentations_path
    end
  end

  private

  def instrumentation_params
    params.require(:instrumentation).permit(:name)
  end


end