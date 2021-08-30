class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
 end

 def create
   @order = Order.new(order_params)
   @cart_items =CartItem.all
   @order.customer_id = current_customer.id
   if @order.save
   @cart_items.each do |cart_item|
    @order_details = @order.order_details.new
    @order_details.order_id = @order.id
    @order_details.item_id = cart_item.item.id
    @order_details.price = cart_item.item.with_tax_price
    @order_details.amount = cart_item.amount
    @order_details.making_status = "production_not_possible"
    @order_details.save
    current_customer.cart_items.destroy_all
   end
   redirect_to orders_complete_path
   else
   @cart_items = current_customer.cart_items
   render :confirm
   end

 end

 def show
   @order=Order.find(params[:id])
 end

 def index
  @order =Order.find_by(params[:created_at])
  @orders =current_customer.orders
 end

 def confirm
  @order =Order.new(order_params)
  # 0.1.2はラジオボタンの分岐のこと！
  @cart_items = current_customer.cart_items
  if params[:order][:select_address].to_i == 0
   @order.address = current_customer.address
   @order.postal_code = current_customer.postal_code
   @order.name = current_customer.last_name + current_customer.first_name
  elsif  params[:order][:select_address].to_i == 1
   @address = Address.find(params[:order][:address_id])
   @order.postal_code = @address.postal_code
   @order.address = @address.address
   @order.name = @address.name
  elsif   params[:order][:select_address].to_i == 2
   @order = Order.new(order_params)
  end
 end

 def complete
 end

 private

 def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at)
 end

end


