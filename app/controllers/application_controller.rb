class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # TODO: move this into a scheduled background job!!
  before_action :check_delayed_invoices

  # def configured_...
  def default_url_options
    { host: ENV["www.mae-compta.com"] || "localhost:3000" }
  end

  # end

  private

  def check_delayed_invoices
    return unless Invoice.to_be_delayed.exists?
    # return unless Invoice.status == "paid" || Invoice.status == "draft"
      Invoice.to_be_delayed.update_all(status: :delayed)
  end
end
