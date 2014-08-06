class AuthorizationsController < ApplicationController


	def show

		if auth = Authorization.find_by_authorization_key( params[:id] )
			po = auth.purchase_order
			po.update_attributes status: "Approved"
			auth.update_attributes authorized: true
			redirect_to purchase_order_path( auth.purchase_order ), notice: "Purchase Order Approved"
		else
			render file: "#{Rails.root}/public/404.html", status: 404
		end

	
	end


	def create

		@purchase_order = PurchaseOrder.find params[:purchase_order_id]

		auth = @purchase_order.authorizations.create params[:authorization]
		AuthorizationsMailer.request_authorization( auth ).deliver!
		
		redirect_to purchase_order_path @purchase_order, notice: "Request sent to #{auth.email}"
	end


	def new

		@purchase_order = PurchaseOrder.find params[:purchase_order_id]
		@authorization = @purchase_order.authorizations.new
		
	end
end

