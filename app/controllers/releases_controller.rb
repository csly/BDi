class ReleasesController < ApplicationController
  def index
    @q = Release.ransack(params[:q])
    @releases = @q.result(distinct: true).paginate(page: params[:page], per_page: 20).order('releases.date DESC')
  end

  def show
    @release = Release.find(params[:id])
  end
end
