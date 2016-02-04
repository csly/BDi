class SearchController < ApplicationController
  respond_to :json, :html

  def index
    company = current_user.admin? ? nil : current_user.production_company
    if params[:q]
      @tracks = Track.search(params[:q], company: company).includes(:productions, :moods, :instrumentations, :styles)
    else
      @tracks = Track.for_company(company).includes(:productions, :moods, :instrumentations, :styles)
    end
    @previous_params = params[:q] || {}
    @productions = Production.find(@tracks.map(&:productions))
    @moods = Mood.for_tracks(@tracks)
    @instrumentations = Instrumentation.for_tracks(@tracks)
    respond_to do |format|
      format.json { render json: { tracks: serialized_tracks, new_url: request.url }, status: :ok }
      format.html
    end
  end

  private

  def serialized_tracks
    data = {}
    %w(track production mood instrumentation).each do |model|
      serializer = "#{model.capitalize}Serializer".constantize
      collection = instance_variable_get("@#{model}s")
      data["#{model}s".to_sym] = ActiveModel::ArraySerializer.new(collection, each_serializer: serializer)
    end
    data
  end
end
