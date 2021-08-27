class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
   @order.postal_code = current_customer.postal_code
   @order.address = current_customer.address
   # @order =current_customer.address_id
 end

 def create

   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   if @order.save
   redirect_to orders_confirm_path(@order)
   else
   render :new
   end
 end

 def show
 end

 def index
 end

 def confirm
   @order = Order.find(params[:id])
 end

 def complete
 end

 private

 def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
 end

end


