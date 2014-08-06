class WebhooksController < ApplicationController

  skip_before_filter :verify_authenticity_token 

   def postmark
    text = request.body.read
    email = Postmark::Mitt.new text
    json = JSON.parse text


    conversation_key = email.mailbox_hash

		if purchase_order = PurchaseOrder.find_by_conversation_key( conversation_key )
      message = <<-MESSAGE
        To: #{email.to}
        From: #{email.from}
        Subject: #{email.subject}
        --------------------------
        #{email.text_body}
      MESSAGE
      new_note = purchase_order.notes.new content: message

    else

      render json: {message: "Unable to find purchase order "}, status: 404

    end
  end

end
