class InvoicesController < ApplicationController
before_action :set_invoice, only: [:show, :edit, :update, :destroy, :calcul_total_amount_ht]
# skip_before_action :authenticate_user!

  def index
    invoices = Invoice.where(user: current_user).order(created_at: :asc)
    if params[:query].present?
      sql_query = "invoices.title ILIKE :query OR clients.company_name ILIKE :query OR invoices.reference ILIKE :query"
      @invoices = invoices.joins(:client).where(sql_query, query: "%#{params[:query]}%")
    else
      @invoices = invoices.all
    end
  end

  def new
    @invoice = Invoice.new
    @invoice.missions_invoices.build
    @my_clients = current_user.clients

    #@my_clients = Client.where(user:current_user).map { |c| [c.company_name, c.id, { class: c.id }] }

    if params[:search]
      @client_found = Client.find(params[:search][:client]) if Client.find(params[:search][:client]).present?

    end

  end

  def show
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    @invoice.client = Client.find(params[:client])
    @my_clients = current_user.clients
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


  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
  def invoice_params
    params.require(:invoice).permit(:client_id, :title, :creation_date, missions_invoices_attributes: [:id, :mission_id, :man_day_quantity, :price_rate, :vat_rate, :_destroy])
  end
end
