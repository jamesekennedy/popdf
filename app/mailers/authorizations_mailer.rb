class AuthorizationsMailer < ActionMailer::Base
  default from: "admin@rubberstamp.io"


  def request_authorization( authorization )

  	@authorization = authorization
  	mail( reply_to: "b2ad75c93e2ff5a6755aa290610af95d+#{@authorization.purchase_order.conversation_key}@inbound.postmarkapp.com", to: authorization.email, subject: "Purchase Order Request")

  	
  end

end
