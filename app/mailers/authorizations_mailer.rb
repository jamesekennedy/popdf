class AuthorizationsMailer < ActionMailer::Base
  default from: "admin@rubberstamp.io"


  def request_authorization( authorization )

  	@authorization = authorization
  	mail( reply_to: "b2ad75c93e2ff5a6755aa290610af95d+#{@authorization.purchase_order.conversation_key}@inbound.postmarkapp.com", to: authorization.email, subject: "Purchase Order Request")

  	
  end


  def notify_update_to_purchase_order( auth )
  	@auth  = auth
  	mail( reply_to: "b2ad75c93e2ff5a6755aa290610af95d+#{@auth.purchase_order.conversation_key}@inbound.postmarkapp.com", to: auth.sender_email, subject: "Purchase Order #{auth.purchase_order.number} #{auth.purchase_order.status}")

  end

end
