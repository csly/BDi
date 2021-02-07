class PurchasesController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :find_item, only: [:checkout]

  def create
    purchase = Purchase.find(params[:invoice])
    purchase.update_from_params(params)

    PurchaseMailer.purchase_complete_email(purchase).deliver_now
    PurchaseMailer.admin_purchase_complete_email(purchase).deliver_now
    head :ok
  end
  
  def show
    @purchase = Purchase.find(params[:id])
  end

  def checkout
    purchase = Purchase.create!(shop_item: @item)
    redirect_to Purchase.paypal_url(@item, purchase, shop_artist_path(@item.artist))
  end

  private

  def find_item
    @item = ShopItem.find(params[:id])
  end

  def artist_shop
    @item.artist_shop
  end
end