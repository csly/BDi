class ArtistShopsController < ApplicationController
  before_action :find_shop

  def show
  end

  

  private

  def find_shop
    @shop = ArtistShop.find_by_artist_id(params[:id])
  end
end