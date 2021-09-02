class Admin::OrdersController < ApplicationController

 def show
  @order_detail =OrderDetail.new
  @order = Order.find(params[:id])
 end

 def update
   @order_detail =OrderDetail.new
   @order = Order.find(params[:id])
  if @order.update(order_params)
   if @order.status == "payment_confirmation"
    @order.order_details.each do |order_detail|
      order_detail.update(making_status:'production_pending')
    end
   end
   redirect_to admin_order_path(@order)
   flash[:notice]='You have updated Order infomation successfully.'
  else
    render :edit
  end
 end

 def order_params
 params.require(:order).permit(:postal_code,:total_payment, :shipping_cost, :address, :name,:payment_method, :status, :created_at)
 end

end