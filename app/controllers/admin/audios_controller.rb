class Admin::AudiosController < Admin::BaseController
  def index
    @audios = Audio.all
  end

  def new
    @audio = Audio.new
  end
   
   def show
   end

  def create
    @audio = Audio.new(audio_params)
    if @audio.save
      redirect_to admin_audios_path
    else
    end
  end

   def destroy
    @audio = Audio.find(params[:id])
    @audio.destroy

    

    redirect_to admin_audio_path

  end


  private

  def audio_params
    params.require(:audio).permit(:name, :track, :artist_id)
  end
end