require 'test_helper'

class PurchaseOrderMailerTest < ActionMailer::TestCase
  test "send_email" do
    mail = PurchaseOrderMailer.send_email
    assert_equal "Send email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
