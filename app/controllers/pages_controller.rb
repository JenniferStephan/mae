class PagesController < ApplicationController

  def home
    @invoices = Invoice.all
    @clients = Client.all
  end


  def test
  end
end
