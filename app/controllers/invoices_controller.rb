class InvoicesController < ApplicationController

before_action :set_invoice, only: [:show, :edit, :update, :destroy, :send_to_client, :calcul_total_amount_ht]

# skip_before_action :authenticate_user!

  def index
    invoices = Invoice.where(user: current_user).order(created_at: :desc)
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


    if params[:search]
      @client_found = Client.find(params[:search][:client]) if Client.find(params[:search][:client]).present?
    end
  end
# I added in the show action of the invoices the method either to see the html version
# of the invoice, or the pdf one.

  def show
    respond_to do |format|
      format.html
      format.pdf do
        @format = 'pdf'

        render pdf: "Invoice No. #{@invoice.reference}",
          page_size: 'A4',
          template: "invoices/show.html.erb",
          layout: "pdf.html",
          orientation: "Portrait",
          lowquality: true,
          zoom: 1,
          dpi: 75,
          encoding: 'utf-8'
      end
    end
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    @invoice.client = Client.find(params[:client])
    @my_clients = current_user.clients
    if @invoice.save
      render :show
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @invoice.destroy
  end


  def invoice_paid
    @invoice = Invoice.find(params[:id])
    @invoice.paid!
    @invoice.update(payment_date: Date.today)
    new_notif_paid = Notification.create(user: current_user,
        category: "Paiement reçu !",
        content: "La facture numero #{@invoice.reference} vient d'être réglée par votre client #{@invoice.client.company_name}, pour un montant total de #{@invoice.total_amount_ttc} euros TTC." )
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def send_to_client
    @invoice.sent!
    @invoice.generate_reference
    new_notif_sent = Notification.create(user: current_user,
      category: "Facture envoyée",
      content: "Vous venez d'envoyer la facture #{@invoice.reference} à votre client #{@invoice.client.company_name}, pour un montant total de #{@invoice.total_amount_ttc}. Votre client a jusqu'au #{@invoice.due_date} pour la régler."
    )
    # InvoiceMailer.send_to_client(@invoice).deliver_now
    # InvoiceMailer.send_to_client(@invoice.id).deliver_now
    redirect_to root_path
    flash[:notice] = "Votre facture a bien été envoyée !"
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
  def invoice_params
    params.require(:invoice).permit(:client_id, :title, :creation_date, :due_date, missions_invoices_attributes: [:id, :mission_id, :man_day_quantity, :price_rate, :vat_rate, :amount, :_destroy])
  end
end
