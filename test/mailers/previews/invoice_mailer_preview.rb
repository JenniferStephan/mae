# Preview all emails at http://localhost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invoice_mailer/send_to_client
  def send_to_client
    InvoiceMailer.send_to_client(Invoice.last)
  end

end
