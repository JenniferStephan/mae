class NotificationsController < ApplicationController
  before_action :set_invoice, only: [:show, :index]

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


    if params[:search]
      @client_found = Client.find(params[:search][:client]) if Client.find(params[:search][:client]).present?
    end
  end


# I added in the show action of the invoices the method either to see the html version
# of the invoice, or the pdf one.


  def show
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

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
  def notification_params
    params.require(:notification).permit(:name, :content, :user)
  end
end
