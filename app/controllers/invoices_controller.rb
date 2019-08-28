class InvoicesController < ApplicationController
before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.where(user: current_user)
    # @invoices = current_user.invoices
  end

  def new
    @invoice = Invoice.new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
  def order_params
    params.require(:invoice).permit()
  end
end
