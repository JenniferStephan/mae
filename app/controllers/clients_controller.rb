class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!

  def new
    @client = Client.new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end
  def client_params
    params.require(:client).permit(:first_last, :last_name)
  end
end
