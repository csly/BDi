class BDiProductionsController < ApplicationController
before_filter :authenticate

  def index  
    @b_di_productions = BDiProduction.all.order('name ASC')   
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "bdimusic" && password == "clientlist"
    end
  end

end

 

   