class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:discover]

  def home
    @invoices = Invoice.all
    @clients = Client.all
  end


  def discover
  end
end
