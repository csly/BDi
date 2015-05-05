class SearchController < ApplicationController
  respond_to :json, :html

  def index
    if params[:q]
      @tracks = Track.search(params[:q]).includes(:productions, :moods, :instrumentations, :styles)
    else
      @tracks = Track.all.includes(:productions, :moods, :instrumentations, :styles)
    end
    @previous_params = params[:q] || {}
    @productions = Production.find(@tracks.map(&:productions))
    @moods = Mood.find(@tracks.map(&:moods))
    @instrumentations = Instrumentation.find(@tracks.map(&:instrumentations))
    @styles = Style.find(@tracks.map(&:styles))
    respond_to do |format|
      format.json { render json: serialized_tracks, status: :ok }
      format.html
    end
  end

  private

  def serialized_tracks
    data = {}
    %w(track style production mood instrumentation).each do |model|
      serializer = "#{model.capitalize}Serializer".constantize
      collection = instance_variable_get("@#{model}s")
      data["#{model}s".to_sym] = ActiveModel::ArraySerializer.new(collection, each_serializer: serializer)
    end
    data
  end
end
