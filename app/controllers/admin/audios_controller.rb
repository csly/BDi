class Admin::AudiosController < Admin::BaseController
  def index 
    @search = Audio.search(params[:q]) 
    if params[:q].nil?
       @audios = @search.result(:distinct => true).order('created_at DESC')
      else
       @audios = @search.result(:distinct => true).order('created_at DESC')
    end
  end 

  def new
    @audio = Audio.new
  end

  def edit
    @audio = Audio.find(params[:id])
  end

  def show
  end

  def create
    @audio = Audio.new(audio_params)
    redirect_to admin_audios_path if @audio.save
  end

  def update
    @audio = Audio.find(params[:id])
    @audio.update(audio_params)

    redirect_to admin_audios_path(@audio)
  end

  def destroy
    @audio = Audio.find(params[:id])
    @audio.destroy

    redirect_to admin_audios_path
  end 

  

  private

  def audio_params
    params.require(:audio).permit(:name, :track, :arrange, :artist_id)
  end
end

 