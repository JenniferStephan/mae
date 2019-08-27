class MissionsInvoicesController < ApplicationController

  def new
    @missions_invoice = MissionsInvoice.new
  end

  def create
    params[:mission].each do |mission|
      MissionsInvoice.create(mission: Mission.find_by_name(mission), invoice: @invoice)
    end
  end

  private

  def set_params
    @invoice = Invoice.find(params[:id])
  end

  def missions_invoices_params
    params.require(:missions_invoice).permit(:mission_id, :invoice_id)
  end
end
