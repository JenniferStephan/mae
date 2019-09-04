require 'tempfile'

class InvoiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invoice_mailer.send_to_client.subject
  #
  def send_to_client(invoice)
    @invoice = invoice
    @client = invoice.client

    attachments["facture-#{invoice.id}.pdf"] = File.read(generate_invoice_pdf_file)

    mail to: invoice.client.email
  end

  private

  def generate_invoice_pdf_file
    pdf_html = ApplicationController.render(
      assigns: {
        invoice: @invoice,
        format: 'pdf'
      },
      template: 'invoices/show',
      layout: 'pdf'
    )

    pdf = WickedPdf.new.pdf_from_string(pdf_html,
      page_size: 'A4',
      orientation: "portrait",
      lowquality: true,
      zoom: 0.9,
      dpi: 75
    )

    tempfile = Tempfile.new("facture-#{@invoice.id}.pdf")

    File.open(tempfile.path, 'wb') do |file|
      file << pdf
    end

    tempfile.close

    return tempfile.path
  end

  def hello
    mail(
      :subject => 'Facturation',
      :to  => 'jennifer.stephan@beta.gouv.fr',
      :from => 'jennifer@mae.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
