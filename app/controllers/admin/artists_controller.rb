class Admin::ArtistsController < Admin::BaseController
  before_action :require_admin

  def index
    @artists = Artist.paginate(page: params[:page], per_page: 20).order('artists.created_at DESC')
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      if params[:artist][:photo].present?
        render :crop ## Render the view for cropping
      else
        redirect_to admin_artists_path(@artist), notice: 'artist was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    if params[:artist][:photo].present?
      render :crop ## Render the view for cropping
    else
      redirect_to admin_artists_path(@artist)
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to admin_artist_path
   end

  def artist_params
    params.require(:artist).permit(:name, :biog, :spotify, :photo, :photo, :catalogue, :biography, :remove_biography, :photo_crop_x,
                                   :photo_crop_y, :photo_crop_w, :photo_crop_h, :links, :composer, :songwriter, :artisttag, :producer, :twitter, :facebook,  article_ids: [],
                                                                                                                                                             award_ids: [], genre_ids: [], type_ids: [], format_ids: [], product_ids: [])
  end
end
