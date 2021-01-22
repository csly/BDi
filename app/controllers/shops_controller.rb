class ShopsController < ApplicationController
  def index 
    @shop_items = ShopItem.order('created_at DESC')
  end
end
