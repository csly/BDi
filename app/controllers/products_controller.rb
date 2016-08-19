class ProductsController < ApplicationController

  def index
    @products = Product.all 
    username = 'bdimusic'
    options = { count: 20, include_rts: true }
    @tweets = $client.user_timeline(username, options)
  end

  def show
    @product = Product.find(params[:id])
  end


end