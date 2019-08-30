class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :simulation]

  def home
    @invoices = Invoice.all
    @clients = Client.all
  end

  def simulation
  end

  def test
  end
end
