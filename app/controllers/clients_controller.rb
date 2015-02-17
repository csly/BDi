class ClientsController < ApplicationController
before_action :require_client
  before_action :authenticate_user!
  def index

  end

  def show

  end

end