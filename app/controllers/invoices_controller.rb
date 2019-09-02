class InvoicesController < ApplicationController
before_action :set_invoice, only: [:show, :edit, :update, :destroy, :calcul_total_amount_ht]
# skip_before_action :authenticate_user!

  def index
    @invoice = Invoice.all
  end

  def new
    @invoice = Invoice.new
    @invoice.missions_invoices.build
  end

  def show
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    if @invoice.save
      # to be changed
      render :new
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def invoice_paid
    @invoice = Invoice.find(params[:id])
    @invoice.paid!
    respond_to do |format|
      format.js
      format.html { redirect_to :root }
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
  def invoice_params
    params.require(:invoice).permit(:client_id, :title, :creation_date, missions_invoices_attributes: [:id, :mission_id, :man_day_quantity, :price_rate, :vat_rate, :_destroy])
  end
end
