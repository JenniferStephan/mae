require 'test_helper'

class InvoiceMailerTest < ActionMailer::TestCase
  test "send_to_client" do
    mail = InvoiceMailer.send_to_client
    assert_equal "Send to client", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
