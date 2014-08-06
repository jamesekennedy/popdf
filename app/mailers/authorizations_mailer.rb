class AuthorizationsMailer < ActionMailer::Base
  default from: "admin@rubberstamp.io"


  def request_authorization( authorization )

  	@authorization = authorization
  	mail( to: authorization.email, subject: "Purchase Order Request")

  	
  end

end
