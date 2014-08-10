class WebhooksController < ApplicationController

  skip_before_filter :verify_authenticity_token 

   def postmark

    text = request.body.read
    email = Postmark::Mitt.new text









    conversation_key = email.mailbox_hash

		if purchase_order = PurchaseOrder.find_by_conversation_key( conversation_key )
      message = <<-MESSAGE
        From: #{email.from}
        Subject: #{email.subject}
        --------------------------
        #{email.text_body}
      MESSAGE
      new_note = purchase_order.notes.new content: message

      if new_note.save
	      render json: purchase_order
        # Okay now lets email everyone that there was a new note.

        recipient_emails = purchase_order
        PurchaseOrderMailer.notify_of_update(recipient_emails , new_note).deliver!
	    else
	    	render json: {message: "Could not save note"}
	    end
    else

      render json: {message: "Unable to find purchase order "}, status: 200

    end
  end

end
