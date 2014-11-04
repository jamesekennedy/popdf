class PurchaseOrderMailer < ActionMailer::Base
  default from: "admin@rubberstamp.io"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_order_mailer.send_email.subject
  #
  def send_email recipient, message, purchase_order

    @message = message
    @purchase_order = purchase_order

    mail to: recipient, subject:  "Purchase Order #{purchase_order.number} from #{purchase_order.your_company_name}"
  end


end
