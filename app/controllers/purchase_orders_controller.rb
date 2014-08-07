class PurchaseOrdersController < ApplicationController
  # GET /purchase_orders
  # GET /purchase_orders.json

  def index
    @purchase_orders = PurchaseOrder.last(20).order("id desc")




    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchase_orders }
    end
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase_order }
      format.pdf do
        # headers['Content-Disposition'] = "attachment; filename=#{@purchase_order.to_label}"
      
        pdf = render pdf: "show"

      end
    end
  end

  # GET /purchase_orders/new
  # GET /purchase_orders/new.json
  def new
    @purchase_order = PurchaseOrder.new session[:preset]

    session[:last_purchase_order_number] ||= 0
    session[:last_purchase_order_number] = session[:last_purchase_order_number] + 1

    @purchase_order.number =  session[:last_purchase_order_number] 

    @purchase_order.line_items.clear

    3.times do 
      @purchase_order.line_items.build
    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase_order }
    end
  end

  # GET /purchase_orders/1/edit
  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create

    @purchase_order = PurchaseOrder.new(params[:purchase_order])
    @purchase_order.status = "Not Authorized"

    unless @purchase_order.line_items.count == 1
      @purchase_order.line_items = @purchase_order.line_items.select do |li| li.description.present? end
    end

    session[:preset] = params[:purchase_order]

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to purchase_order_path(@purchase_order )}
        format.json { render json: @purchase_order, status: :created, location: @purchase_order }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_orders/1
  # PUT /purchase_orders/1.json
  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      if @purchase_order.update_attributes(params[:purchase_order])
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.destroy

    respond_to do |format|
      format.html { redirect_to purchase_orders_url }
      format.json { head :no_content }
    end
  end
end
