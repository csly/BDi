class ShopsController < ApplicationController
  def index 
    if params[:q]
      @shop_items = ShopItem.search(params[:q]).paginate(page: params[:page], per_page: 25)
       
      if @shop_items.blank?
        redirect_to shops_path(@shop_items), notice: 'There are no items that match your search requirements. Please try again'
      end
      else
      params[:limit] ||= 25
      @shop_items = ShopItem.ordered_by_artist.paginate(page: params[:page], per_page: params[:limit])
       
    end
  end
end


   

   